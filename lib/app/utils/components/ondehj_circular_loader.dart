import 'package:flutter/material.dart';

import '../design/ondehj_icon_font.dart';

class OndeHjCircularLoader extends StatefulWidget {
  final double size;
  final Color? color;
  final Color backgroundColor;

  const OndeHjCircularLoader({
    this.size = 40,
    this.color,
    this.backgroundColor = Colors.transparent,
    super.key,
  });
  // coverage:ignore-end

  @override
  OndeHjCircularLoaderState createState() => OndeHjCircularLoaderState();
}

class OndeHjCircularLoaderState extends State<OndeHjCircularLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.backgroundColor,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0.5,
              left: 0,
              right: 0,
              child: Icon(
                OndeHjIconFont.iconLoading,
                color: widget.color ?? Theme.of(context).colorScheme.secondary,
                size: widget.size - 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
