import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<S extends StatefulWidget> extends State<S> {
  void finish<T>() => Navigator.of(context).pop(T);

  Future push<T>(Widget screen) => Navigator.of(context).push<T>(
        MaterialPageRoute(
          builder: (_) => screen,
        ),
      );

  R getComponent<R>() => Provider.of<R>(context, listen: false);
}
