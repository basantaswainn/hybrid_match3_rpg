import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium victory celebration screen.
class VictoryScreen extends StatelessWidget {
  const VictoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1F2937), Color(0xFF7C3AED), Color(0xFFEC4899)]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.16),
                    boxShadow: [BoxShadow(color: AppConstants.gold.withValues(alpha: 0.24), blurRadius: 40)],
                  ),
                  child: const Icon(Icons.emoji_events_rounded, size: 72, color: AppConstants.gold),
                ),
                const SizedBox(height: 20),
                const Text('Victory!', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                const Text('The kingdom shines brighter with your discovery.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 20),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Expanded(child: _RewardStat(icon: Icons.star_rounded, label: 'Stars', value: '3/3')),
                      SizedBox(width: 10),
                      Expanded(child: _RewardStat(icon: Icons.monetization_on, label: 'Coins', value: '+250')),
                      SizedBox(width: 10),
                      Expanded(child: _RewardStat(icon: Icons.auto_awesome, label: 'XP', value: '+120')),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    GamePrimaryButton(label: 'Next Level', icon: Icons.arrow_forward_rounded, onPressed: () => context.go('/gameplay')),
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

class _RewardStat extends StatelessWidget {
  const _RewardStat({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppConstants.gold, size: 20),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
