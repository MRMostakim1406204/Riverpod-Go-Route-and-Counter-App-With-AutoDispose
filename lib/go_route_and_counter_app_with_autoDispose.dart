import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_demo.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>(((ref) {
  final link = ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), () {
    link.close();
  });
  ref.onDispose(() {
    timer.cancel();
  });
  return CounterDemo();
}));

class CounterAppWithAutoDispose extends ConsumerWidget {
  const CounterAppWithAutoDispose({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("State Provider"),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
                // OR
                // ref.refresh(counterProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body:
          Center(child: Text(count.toString(), style: TextStyle(fontSize: 25))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          // OR
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
