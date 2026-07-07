import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium profile overview screen.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF312E81)]),
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
                    const Expanded(child: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 20),
                GameGlassCard(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 30, backgroundColor: AppConstants.primaryPink, child: Icon(Icons.person, color: Colors.white, size: 28)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Aurelia', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                            Text('Legendary Explorer', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                      const FloatingStatChip(icon: Icons.emoji_events_rounded, label: 'Level', value: '12'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Statistics', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                      SizedBox(height: 12),
                      _StatRow(label: 'Games Played', value: '132'),
                      SizedBox(height: 8),
                      _StatRow(label: 'Win Rate', value: '84%'),
                      SizedBox(height: 8),
                      _StatRow(label: 'Highest Combo', value: '26'),
                      SizedBox(height: 8),
                      _StatRow(label: 'Highest Score', value: '28.4k'),
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

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
