// sqliteとapiを結合した結果のモデル。
// そこそこ変更があるプロパティがあって、sqliteに保存したくない場合など
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'products/products.dart';
import 'user_product/user_product.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

@freezed
class UserDevice with _$UserDevice {
  const UserDevice._();

  // insert文の時はidは不要でいいけど、他で色々困る
  const factory UserDevice(
      {int? id, required int inUse, required String name}) = _UserDevice;

  bool inUseToBool() => inUse == 0 ? false : true;
}

@freezed
class Devices with _$Devices {
  const factory Devices({required List<UserDevice> devices}) = _Devices;
}

// sqliteのデータとapiのデータを結合する
@riverpod
class UserDevicesNotifier extends _$UserDevicesNotifier {
  @override
  Future<List<UserDevice>?> build() async {
    final userProducts = await ref.watch(allUserProductsProvider.future);

    // このproviderが破棄されるタイミングでデータをDBに同期する
    // 動作未確認
    ref.onDispose(() async {
      await syncData();
    });

    final userProductIds = userProducts?.map((e) => e.id);

    if (userProductIds == null) return null;

    // api側にidの配列を受け取るようなエンドポイントがあればよかったけど、
    // なかったのでその下の処理が複雑になってます
    final products = await ref.watch(allProductsProvider.future);

    return userProducts?.map((e) {
      final filterd = products?.firstWhere((p) => p.id == e.id);
      return UserDevice(id: e.id, name: filterd?.title ?? "", inUse: e.inUse);
    }).toList();
  }

  void toggle(int id) async {
    final previousState = await future;

    if (previousState == null) return;

    final subsequent = [
      for (final e in previousState)
        if (id == e.id)
          UserDevice(id: e.id, inUse: reverseInUse(e.inUse), name: e.name)
        else
          e
    ];

    // sqliteに保存
    await syncData();

    state = AsyncData(subsequent);
  }

  int reverseInUse(int inUse) => inUse == 0 ? 1 : 0;

  // プロバイダーが破棄されたタイミングなどでsqliteのデータを同期する
  Future<void> syncData() async {
    final repo = await ref.read(userProductRepositoryProvider.future);
    final previousState = await future;
    final userProducts = previousState
        ?.map((e) => UserProduct(id: e.id, inUse: e.inUse))
        .toList();
    if (userProducts == null) {
      return;
    } else {
    }

    repo.syncData(userProducts);
  }
}
