library w;

import 'package:flutter/material.dart';

class DabAnimation extends StatefulWidget {
  final Widget child;

  const DabAnimation({
    required this.child,
    super.key,
  });

  @override
  createState() => _DabAnimationState();
}

class _DabAnimationState extends State<DabAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _translationAnimation;

  @override
   initState() {
    super.initState();

    // Initialize the animation controller.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define the rotation animation (dab-like motion).
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: -0.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Define the translation animation.
    _translationAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.2, -0.2),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startDabAnimation() async {
    await _controller.forward();
    _controller.reverse();
  }

  @override
  build(context) {
    return GestureDetector(
      onTap: _startDabAnimation,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _translationAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
