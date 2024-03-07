import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'products.dart';
import 'user_products.dart';

part 'main.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

@riverpod
Future<List<Product>?> combine(CombineRef ref) async {
  final userProducts = await ref.watch(allUserProductsProvider.future);
  final userProductIds = userProducts?.map((e) => e.id);

  if (userProductIds == null) return null;

  // 本当は、必要な分だけパラメータを与えて取れればいいけど、
  // そういうパラメータがなかった
  final products = await ref.watch(allProductsProvider.future);

  return products?.where((e) => userProductIds.contains(e.id)).toList();
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
      home: const Scaffold(body: MyWidget(),)
    );
  }
}

// TODO: アイテムを追加した時に発火させるのどうやるんだ？
class MyWidget extends HookConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(combineProvider);
    return Center(child: asyncProducts.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: data
                        ?.map((e) => ListTile(
                              title: Text(e.title),
                            ))
                        .toList() ??
                    [const Center(child: Text('empty'),)],
              ),
          error: (_, error) {
            return const Text('error');
          },
          loading: () => const Text('Loading...')
    ,)
    );
  }
}
