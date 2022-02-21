import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/ui/home/home_bloc.dart';
import 'package:tonder/widget/image_drag_pop.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseStateBloc<HomeView, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageDragPop(
          'https://picsum.photos/id/237/200/300',
          width: MediaQuery.of(context).size.width / 10 * 8.5,
          height: MediaQuery.of(context).size.height / 10 * 6,
          onSwipeLeft: () {
            Navigator.of(context).pop();
          },
          onSwipeRight: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
