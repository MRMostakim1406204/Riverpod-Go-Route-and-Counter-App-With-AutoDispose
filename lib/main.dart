import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_go_route_and_autodispos_counter_app/go_route.dart';
import 'package:riverpod_go_route_and_autodispos_counter_app/go_route_and_counter_app_with_autoDispose.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // home: PracticeEight(),
      routerConfig: _route,
    );
  }
}

final GoRouter _route = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => GoRoutePage()),
  GoRoute(
      path: "/PracticeEight",
      builder: (context, state) => CounterAppWithAutoDispose()),
]);
