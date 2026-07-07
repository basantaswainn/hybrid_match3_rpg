import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium hero collection screen.
class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0F766E)]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton.filledTonal(onPressed: () => context.go('/home'), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    const SizedBox(width: 12),
                    const Expanded(child: Text('Heroes', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: const [
                      _HeroCard(name: 'Aria', role: 'Mage', accent: AppConstants.primaryPink, power: 'Magic +35'),
                      _HeroCard(name: 'Ronan', role: 'Warrior', accent: AppConstants.primaryCyan, power: 'Attack +25'),
                      _HeroCard(name: 'Lyra', role: 'Scout', accent: AppConstants.gold, power: 'Critical +20'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.name, required this.role, required this.accent, required this.power});

  final String name;
  final String role;
  final Color accent;
  final String power;

  @override
  Widget build(BuildContext context) {
    return GameGlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withValues(alpha: 0.24)),
            child: Icon(Icons.shield_outlined, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(role, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 6),
                Text(power, style: const TextStyle(color: AppConstants.gold, fontSize: 12, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          GamePrimaryButton(label: 'Upgrade', onPressed: () {}),
        ],
      ),
    );
  }
}
