import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Level-selection screen before each run.
class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF0F1C2C), Color(0xFF23395A), Color(0xFF4C2A6A)]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton.filledTonal(onPressed: () => context.go('/world-map'), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    const SizedBox(width: 12),
                    const Expanded(child: Text('Forest • Level 12', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 18),
                GameGlassCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Objectives', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      const _ObjectiveChip(label: 'Collect 25 gems'),
                      const SizedBox(height: 8),
                      const _ObjectiveChip(label: 'Score 12000'),
                      const SizedBox(height: 8),
                      const _ObjectiveChip(label: 'Break 8 stones'),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(child: _StatTile(label: 'Moves', value: '20')),
                          const SizedBox(width: 12),
                          Expanded(child: _StatTile(label: 'Target', value: '12k')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _StatTile(label: 'Reward', value: '150 coins')),
                          const SizedBox(width: 12),
                          Expanded(child: _StatTile(label: 'Boosters', value: '4')),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Boosters', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: const [
                          _BoosterPill(icon: Icons.build_rounded, label: 'Hammer'),
                          _BoosterPill(icon: Icons.bubble_chart_rounded, label: 'Bomb'),
                          _BoosterPill(icon: Icons.auto_fix_high_rounded, label: 'Rainbow'),
                          _BoosterPill(icon: Icons.shuffle_rounded, label: 'Shuffle'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(child: GamePrimaryButton(label: 'Start', icon: Icons.play_arrow_rounded, onPressed: () => context.go('/gameplay'))),
                    const SizedBox(width: 12),
                    Expanded(child: OutlinedButton.icon(onPressed: () => context.go('/world-map'), icon: const Icon(Icons.arrow_back_ios_new_rounded), label: const Text('Back'))),
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

class _ObjectiveChip extends StatelessWidget {
  const _ObjectiveChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: AppConstants.primaryPink.withValues(alpha: 0.19),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: 0.1),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _BoosterPill extends StatelessWidget {
  const _BoosterPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Colors.white.withValues(alpha: 0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
