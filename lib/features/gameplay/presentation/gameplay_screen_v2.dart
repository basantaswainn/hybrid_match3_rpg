import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium gameplay HUD and board shell.
class GameplayScreenV2 extends StatelessWidget {
  const GameplayScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF111827), Color(0xFF1F2937), Color(0xFF312E81)]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: GameGlassCard(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    children: [
                      IconButton.filledTonal(onPressed: () => context.go('/home'), icon: const Icon(Icons.home_rounded)),
                      const SizedBox(width: 8),
                      const Expanded(child: Text('Level 12 • Forest', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                      const FloatingStatChip(icon: Icons.score_rounded, label: 'Score', value: '4800'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GameGlassCard(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: const [
                      Expanded(child: _ProgressStat(label: 'Moves', value: '18')), 
                      SizedBox(width: 10),
                      Expanded(child: _ProgressStat(label: 'Target', value: '12k')),
                      SizedBox(width: 10),
                      Expanded(child: _ProgressStat(label: 'Coins', value: '140')),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GameGlassCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(colors: [Color(0xFF2E1065), Color(0xFF312E81)]),
                            ),
                            child: GridView.count(
                              crossAxisCount: 8,
                              children: List.generate(64, (index) {
                                final colors = [AppConstants.primaryPink, AppConstants.primaryCyan, AppConstants.gold, AppConstants.emerald, AppConstants.coral];
                                final color = colors[index % colors.length];
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: color,
                                    boxShadow: [BoxShadow(color: color.withValues(alpha: 0.25), blurRadius: 8)],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            _BoosterButton(icon: Icons.build_rounded, label: 'Hammer'),
                            const SizedBox(width: 8),
                            _BoosterButton(icon: Icons.bubble_chart_rounded, label: 'Bomb'),
                            const SizedBox(width: 8),
                            _BoosterButton(icon: Icons.auto_fix_high_rounded, label: 'Rainbow'),
                            const SizedBox(width: 8),
                            _BoosterButton(icon: Icons.undo_rounded, label: 'Undo'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: GamePrimaryButton(label: 'Pause', icon: Icons.pause_rounded, onPressed: () => context.go('/gameplay')),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => context.go('/victory'),
                        icon: const Icon(Icons.emoji_events_rounded),
                        label: const Text('Complete'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressStat extends StatelessWidget {
  const _ProgressStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _BoosterButton extends StatelessWidget {
  const _BoosterButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
