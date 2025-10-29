import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'screens/select_station_screen.dart';
import 'widgets/eden_loader.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const LN247App());
  });
}

class LN247App extends StatelessWidget {
  const LN247App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LN247 TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA722),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFA722),
          primary: const Color(0xFFFFA722),
          secondary: Colors.black,
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    // Simulate initialization delay (e.g., fetching streams, preparing controllers)
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() => _loading = false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SelectStationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const EdenLoader(size: 80),
                  const SizedBox(height: 24),
                  Text(
                    'Loading LN247...',
                    style: TextStyle(
                      color: const Color(0xFFFFA722).withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
