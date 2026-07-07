import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium events and missions screen.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF172554), Color(0xFF312E81), Color(0xFF1D4ED8)]),
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
                    const Expanded(child: Text('Events', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 16),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Daily Missions', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                      SizedBox(height: 12),
                      _MissionRow(label: 'Complete 5 levels', reward: '+100 gems'),
                      SizedBox(height: 8),
                      _MissionRow(label: 'Open treasure chest', reward: '+2 boosters'),
                      SizedBox(height: 8),
                      _MissionRow(label: 'Watch rewarded video', reward: '+50 coins'),
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

class _MissionRow extends StatelessWidget {
  const _MissionRow({required this.label, required this.reward});

  final String label;
  final String reward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), color: AppConstants.gold.withValues(alpha: 0.2)),
          child: Text(reward, style: const TextStyle(color: AppConstants.gold, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
