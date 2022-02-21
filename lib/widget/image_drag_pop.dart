import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

class ImageDragPop extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  final Function()? onSwipeLeft;
  final Function()? onSwipeRight;
  final Function()? onSwipeTop;
  final Function()? onSwipeBottom;

  const ImageDragPop(
    this.imageUrl, {
    Key? key,
    this.width = 300,
    this.height = 500,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeTop,
    this.onSwipeBottom,
  }) : super(key: key);

  @override
  _ImageDragPopState createState() => _ImageDragPopState();
}

class _ImageDragPopState extends State<ImageDragPop>
    with TickerProviderStateMixin {
  final BehaviorSubject<Offset> _bsOffset = BehaviorSubject();
  final BehaviorSubject<Offset> _bsRotation = BehaviorSubject();

  late Offset _startDragOffset;

  late AnimationController _backAnimController;
  Animation<Offset>? _backAnim;

  bool finished = false;

  Function()? _endingFunc;

  @override
  void initState() {
    super.initState();
    _backAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() {
        _bsOffset.add(_backAnim?.value ?? const Offset(0, 0));
      });
  }

  @override
  void dispose() {
    _backAnimController.dispose();
    _bsOffset.close();
    _bsRotation.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _startDrag,
      onPanUpdate: _dragUpdate,
      onPanEnd: _endDrag,
      child: StreamBuilder<Offset>(
        initialData: const Offset(0, 0),
        stream: _bsOffset,
        builder: (context, snapshot) {
          return Transform.translate(
            offset: _calNewOffset(
              snapshot.data ?? const Offset(0, 0),
            ),
            child: StreamBuilder<Offset>(
              stream: _bsRotation,
              builder: (context, snapshot) {
                return Transform.rotate(
                  angle: _calRotation(snapshot.data),
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _startDrag(DragStartDetails detail) {
    if (finished) {
      return;
    }

    _startDragOffset = detail.globalPosition;
    _bsRotation.add(detail.localPosition);
  }

  void _dragUpdate(DragUpdateDetails update) {
    if (finished) {
      return;
    }

    _bsOffset.add(
      update.globalPosition - _startDragOffset,
    );
    _bsRotation.add(update.globalPosition);
  }

  void _endDrag(DragEndDetails end) {
    if (_checkVelocity(end.velocity.pixelsPerSecond)) {
      finished = true;
      _ending(end.velocity.pixelsPerSecond);
      _setupAnimationEnd(end.velocity.pixelsPerSecond);
    } else {
      _goingBack();
    }
  }

  void _goingBack() {
    _startDragOffset = const Offset(0, 0);
    Offset endPoint = Offset(_bsOffset.value.dx, _bsOffset.value.dy);

    _backAnim = Tween<Offset>(
      begin: endPoint,
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _backAnimController,
        curve: Curves.linear,
      ),
    );

    _backAnimController.forward(from: 0);
    _bsRotation.add(const Offset(0, 0));
  }

  void _ending(Offset velocity) {
    if (velocity.dx.abs() > velocity.dy.abs()) {
      /// swipe left swipe right
      ///
      if (velocity.dx > 0) {
        /// swipe right
        ///
        _endingFunc = widget.onSwipeRight;
      } else {
        /// swipe left
        ///
        _endingFunc = widget.onSwipeLeft;
      }
    } else {
      /// swipe up swipe down
      ///
      if (velocity.dy > 0) {
        /// swipe bottom
        ///
        _endingFunc = widget.onSwipeBottom;
      } else {
        /// swipe top
        ///
        _endingFunc = widget.onSwipeTop;
      }
    }
  }

  bool _checkVelocity(Offset velocity) {
    if (max(velocity.dx, velocity.dy).abs() > 1000) {
      return true;
    }

    return false;
  }

  Offset _calNewOffset(Offset offset) {
    return offset;
  }

  double _calRotation(Offset? offset) {
    if (offset == null) {
      return 0;
    }

    Offset calOffset = Offset(
      offset.dx - _startDragOffset.dx,
      offset.dy - _startDragOffset.dy,
    );

    return (calOffset.dx / widget.width!) * pi / 12;
  }

  double _calLength2Offset(Offset p1, Offset p2) {
    return sqrt(
        (p2.dx - p1.dx) * (p2.dx - p1.dx) + (p2.dy - p1.dy) * (p2.dy - p1.dy));
  }

  Offset _getCenter() {
    return Offset(MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height / 2);
  }

  void _setupAnimationEnd(Offset pixelsPerSecond) {
    _backAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        _bsOffset.add(_backAnim?.value ?? const Offset(0, 0));

        if (_backAnim != null) {
          if (_calLength2Offset(
                  _backAnim!.value + _startDragOffset, _getCenter()) >
              max(MediaQuery.of(context).size.height,
                          MediaQuery.of(context).size.width) /
                      2 +
                  20) {
            _backAnimController.stop();
            if (_endingFunc != null) {
              _endingFunc!();
            }
          }
        }
      });

    Offset startPoint = Offset(_bsOffset.value.dx, _bsOffset.value.dy);

    _backAnim = Tween<Offset>(
      begin: startPoint,
      end: (pixelsPerSecond - startPoint) + startPoint,
    ).animate(
      CurvedAnimation(
        parent: _backAnimController,
        curve: Curves.linear,
      ),
    );

    _backAnimController.forward(from: 0);
  }
}
