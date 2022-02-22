import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final Function()? onClick;
  final Widget? child;
  final Color borderColor;

  const ControlButton({
    Key? key,
    this.child,
    this.onClick,
    this.borderColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child ?? Container(),
        ),
      ),
    );
  }
}
