import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/ui/home/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseStateBloc<HomeView, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tonder'),
      ),
    );
  }
}
