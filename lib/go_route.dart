import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRoutePage extends StatelessWidget {
  const GoRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push("/PracticeEight");
                },
                child: Text("Counter"))));
  }
}
