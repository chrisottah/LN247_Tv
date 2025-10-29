import 'dart:async';
import 'package:flutter/material.dart';
import 'select_station_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;
  final List<String> _words = ['Welcome', 'To', 'LN247', 'TV'];

  @override
  void initState() {
    super.initState();

    // Animation duration adapts to screen size (longer for TVs)
    final duration = Duration(seconds: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width > 1200 ? 7 : 5);

    _controller = AnimationController(vsync: this, duration: duration);

    _fadeAnims = List.generate(_words.length, (i) {
      final start = i / _words.length;
      final end = (i + 1) / _words.length;
      return CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeIn));
    });

    _slideAnims = List.generate(_words.length, (i) {
      final start = i / _words.length;
      final end = (i + 1) / _words.length;
      return Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeOut)));
    });

    _controller.forward();

    // Navigate after full animation + pause
    Timer(duration + const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SelectStationScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedWords(double fontSize, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_words.length, (index) {
        return FadeTransition(
          opacity: _fadeAnims[index],
          child: SlideTransition(
            position: _slideAnims[index],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _words[index],
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;

    final logoSize = isLargeScreen ? 240.0 : 140.0;
    final fontSize = isLargeScreen ? 48.0 : 28.0;
    final spacing = isLargeScreen ? 40.0 : 24.0;
    final textColor = Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/ln247_logo.png', width: logoSize, height: logoSize),
            SizedBox(height: spacing),
            _buildAnimatedWords(fontSize, textColor),
          ],
        ),
      ),
    );
  }
}
