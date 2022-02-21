import 'package:flutter/material.dart';
import 'package:tonder/base/base_bloc.dart';

import 'base_state.dart';

abstract class BaseStateBloc<S extends StatefulWidget, B extends BaseBloc>
    extends BaseState<S> {
  B getBloc() => getComponent<B>();
}
