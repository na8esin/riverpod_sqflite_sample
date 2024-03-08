import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'products/products.dart';
import 'user_device/user_device.dart';

part 'main.g.dart';

// 大体のコードは下記を参考にしてます。
// https://github.com/rrousselGit/riverpod/blob/master/examples/todos/lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// TODO: この画面に表示するリストのstate. UserProducts
// filter用のstate,
// filterはどうやってかけよう。riverpodのsampleみたいにボタンにしようか

// busy: 使用中
// unoccupied: 使用されてない
enum DeviceListFilter { all, busy, unoccupied }

@riverpod
Future<List<Product>?> combine(CombineRef ref) async {
  final userProducts = await ref.watch(allUserDevicesProvider.future);
  final userProductIds = userProducts?.map((e) => e.id);

  if (userProductIds == null) return null;

  // 本当は、必要な分だけパラメータを与えて取れればいいけど、
  // そういうパラメータがなかった
  final products = await ref.watch(allProductsProvider.future);

  return products?.where((e) => userProductIds.contains(e.id)).toList();
}

// final userDeviceListProvider;

// フィルターの状態
@riverpod
class ListFilterNotifier extends _$ListFilterNotifier {
  @override
  int build() => 0;

  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) => state = cb(state);
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: MyWidget(),
        ));
  }
}

// TODO: アイテムを追加した時に発火させるのどうやるんだ？
class MyWidget extends HookConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(combineProvider);
    return Center(
        child: asyncProducts.when(
      data: (data) => ListView(
        children: data
                ?.map((e) => ListTile(
                      title: Text(e.title),
                    ))
                .toList() ??
            [
              const Center(
                child: Text('empty'),
              )
            ],
      ),
      error: (_, error) {
        return const Text('error');
      },
      loading: () => const Text('Loading...'),
    ));
  }
}

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(listFilterProvider.notifier);

//    final filterState = ref.read(listFilterProvider.notifier).state;

    return Material(
        child: ListView(
      children: [TextButton(onPressed: () => filter.state = DeviceListFilter.all, child: Container())],
    ));
  }
}
