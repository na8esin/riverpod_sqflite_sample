import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'insert_test_data.dart';
import 'user_device.dart';

part 'main.g.dart';

// 大体のコードは下記を参考にしてます。
// https://github.com/rrousselGit/riverpod/blob/master/examples/todos/lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await insertTestData();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// busy: デバイスが使用中
// unoccupied: デバイスが使用中でない
enum DeviceState { all, busy, unoccupied }

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

@riverpod
Future<List<UserDevice>?> filteredDevices(FilteredDevicesRef ref) async {
  final filter = ref.watch(listFilterNotifierProvider);
  final devices = await ref.watch(userDevicesNotifierProvider.future);

  switch (filter) {
    case DeviceState.busy:
      return devices?.where((e) => e.inUseToBool()).toList();
    case DeviceState.unoccupied:
      return devices?.where((e) => !e.inUseToBool()).toList();
    case DeviceState.all:
      return devices;
  }
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    Future(() async {
      final notifier = ref.read(userDevicesNotifierProvider.notifier);
      SchedulerBinding.instance.lifecycleState;
      _listener = AppLifecycleListener(
        onPause: () async => await notifier.syncData(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
    print("widget dispose");
  }
}

class MyWidget extends HookConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDevices = ref.watch(filteredDevicesProvider);
    return Center(
        child: asyncDevices.when(
            data: (devices) {
              return ListView(
                children: devices == null
                    ? []
                    : [
                        const Toolbar(),
                        for (var e in devices)
                          ProviderScope(
                            overrides: [
                              currentItemProvider.overrideWithValue(e)
                            ],
                            child: const Item(),
                          ),
                      ],
              );
            },
            error: (_, error) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}

@Riverpod(dependencies: [])
UserDevice currentItem(CurrentItemRef ref) {
  throw UnimplementedError();
}

class Item extends HookConsumerWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDevice = ref.watch(currentItemProvider);

    return Material(
      color: Colors.white,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(userDevice.name),
          leading: Checkbox(
              value: userDevice.inUseToBool(),
              onChanged: (_) {
                if (userDevice.id != null) {
                  ref
                      .read(userDevicesNotifierProvider.notifier)
                      .toggle(userDevice.id!);
                }
              }),
        ),
      ),
    );
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
