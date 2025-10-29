import 'package:flutter/material.dart';

class EdenLoader extends StatefulWidget {
  final double size;
  const EdenLoader({super.key, this.size = 60});

  @override
  State<EdenLoader> createState() => _EdenLoaderState();
}

class _EdenLoaderState extends State<EdenLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.8, end: 1.2).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFFA722).withOpacity(0.85),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFA722).withOpacity(0.6),
              blurRadius: 25,
              spreadRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
