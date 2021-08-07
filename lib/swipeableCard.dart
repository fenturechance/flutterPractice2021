import 'package:flutter/material.dart' hide Card;
import 'dart:ui';
import './card.dart';
import 'package:flutter/physics.dart';

class SwipeableCard extends StatefulWidget {
  final String imageAssetName;
  final VoidCallback onSwiped;
  const SwipeableCard(
      {required this.onSwiped, required this.imageAssetName, Key? key})
      : super(key: key);

  @override
  _SwipeableCardState createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late double _dragStartX;
  bool _isSwipingLeft = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: Card(imageAssetName: widget.imageAssetName),
      ),
    );
  }

  void _dragStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }

  void _dragUpdate(DragUpdateDetails details) {
    var isSwipingLeft = (details.localPosition.dx - _dragStartX) < 0;
    if (isSwipingLeft != _isSwipingLeft) {
      _isSwipingLeft = isSwipingLeft;
      _updateAnimation(details.localPosition.dx);
    }

    setState(() {
      final size = context.size;

      if (size == null) {
        return;
      }

      // Calculate the amount dragged in unit coordinates (between 0 and 1)
      // using this widgets width.
      _controller.value =
          (details.localPosition.dx - _dragStartX).abs() / size.width;
    });
  }

  void _dragEnd(DragEndDetails details) {
    final size = context.size;

    if (size == null) {
      return;
    }

    var velocity = (details.velocity.pixelsPerSecond.dx / size.width).abs();
    _animate(velocity: velocity);
  }

  void _updateAnimation(double dragPosition) {
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: _isSwipingLeft ? const Offset(-1, 0) : const Offset(1, 0),
    ));
  }

  void _animate({double velocity = 0}) {
    var description =
        const SpringDescription(mass: 50, stiffness: 1, damping: 1);
    var simulation =
        SpringSimulation(description, _controller.value, 1, velocity);
    _controller.animateWith(simulation).then<void>((_) {
      widget.onSwiped();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
