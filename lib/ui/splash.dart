import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/ui/home/home_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Go'),
          onPressed: () {
            push(homeRoute);
          },
        ),
      ),
    );
  }
}
