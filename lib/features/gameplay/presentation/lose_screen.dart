import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium defeat / retry screen.
class LoseScreen extends StatelessWidget {
  const LoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1F2937), Color(0xFF4C1D95), Color(0xFF7F1D1D)]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.16)),
                  child: const Icon(Icons.warning_amber_rounded, size: 72, color: AppConstants.coral),
                ),
                const SizedBox(height: 20),
                const Text('Out of Moves', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                const Text('The ruins still hold their secrets. Try again with a booster.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 24),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Expanded(child: _OutcomeChip(icon: Icons.refresh_rounded, label: 'Retry')),
                      SizedBox(width: 10),
                      Expanded(child: _OutcomeChip(icon: Icons.auto_fix_high_rounded, label: 'Booster')),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    GamePrimaryButton(label: 'Retry', icon: Icons.refresh_rounded, onPressed: () => context.go('/gameplay')),
                    OutlinedButton.icon(onPressed: () => context.go('/world-map'), icon: const Icon(Icons.map_rounded), label: const Text('World Map')),
                    OutlinedButton.icon(onPressed: () => context.go('/home'), icon: const Icon(Icons.home_rounded), label: const Text('Home')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OutcomeChip extends StatelessWidget {
  const _OutcomeChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppConstants.coral, size: 18),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
