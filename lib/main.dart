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
enum DeviceState { all, busy, unoccupied }

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

// フィルターの状態。
// `StateProvider is to be avoided` と↓に書かれてるので書き換えてみた
// https://riverpod.dev/ja/docs/migration/from_state_notifier#from-stateprovider
@riverpod
class ListFilterNotifier extends _$ListFilterNotifier {
  @override
  DeviceState build() => DeviceState.all;

  @override
  set state(DeviceState newState) => super.state = newState;
  DeviceState update(DeviceState Function(DeviceState state) cb) =>
      state = cb(state);
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

class MyWidget extends HookConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(combineProvider);
    return Center(
        child: asyncProducts.when(
      data: (data) {
        return ListView(
          children: data == null
              ? []
              : [Toolbar(), for (var e in data) Text(e.title)],
        );
      },
      error: (_, error) {
        return const Text('error');
      },
      loading: () => const Text('Loading...'),
    ));
  }
}

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(listFilterNotifierProvider.notifier);

    return Material(
      child: Row(children: [
        for (var value in DeviceState.values)
          TextButton(
            onPressed: () => filter.update((state) => value),
            child: Text(value.name),
          )
      ]),
    );
  }
}
