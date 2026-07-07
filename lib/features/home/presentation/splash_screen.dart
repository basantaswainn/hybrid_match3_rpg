import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A lightweight splash screen that introduces the game and routes to the home view.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5B21B6), Color(0xFF7C3AED), Color(0xFFEC4899)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.diamond_outlined, size: 88, color: Colors.white),
              const SizedBox(height: 24),
              const Text(
                'Treasure Legends',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Hybrid Match-3 • RPG Adventure',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 28),
              FilledButton.tonal(
                onPressed: () => context.go('/home'),
                child: const Text('Enter Kingdom'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
