import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// World map view with animated kingdom nodes.
class WorldMapScreen extends StatelessWidget {
  const WorldMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final worlds = [
      _WorldNode(title: 'Forest', subtitle: 'World 1', unlocked: true, color: AppConstants.emerald),
      _WorldNode(title: 'Desert', subtitle: 'World 2', unlocked: true, color: AppConstants.gold),
      _WorldNode(title: 'Snow', subtitle: 'World 3', unlocked: false, color: AppConstants.primaryCyan),
      _WorldNode(title: 'Volcano', subtitle: 'World 4', unlocked: false, color: AppConstants.coral),
      _WorldNode(title: 'Temple', subtitle: 'World 5', unlocked: false, color: AppConstants.primaryPurple),
      _WorldNode(title: 'Ocean', subtitle: 'World 6', unlocked: false, color: AppConstants.primaryPink),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF10203A), Color(0xFF1C2C46), Color(0xFF47296A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => context.go('/home'),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'World Map',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                    ),
                    const FloatingStatChip(icon: Icons.star_rounded, label: 'Stars', value: '12'),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: worlds.map((world) => _WorldCard(world: world)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorldCard extends StatelessWidget {
  const _WorldCard({required this.world});

  final _WorldNode world;

  @override
  Widget build(BuildContext context) {
    return GameGlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [world.color, world.color.withValues(alpha: 0.7)]),
            ),
            child: Icon(world.unlocked ? Icons.explore_rounded : Icons.lock_rounded, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12),
          Text(world.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(world.subtitle, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12)),
          const SizedBox(height: 14),
          GamePrimaryButton(
            label: world.unlocked ? 'Open' : 'Locked',
            onPressed: world.unlocked ? () => context.go('/level-select') : () {},
          ),
        ],
      ),
    );
  }
}

class _WorldNode {
  const _WorldNode({required this.title, required this.subtitle, required this.unlocked, required this.color});

  final String title;
  final String subtitle;
  final bool unlocked;
  final Color color;
}
