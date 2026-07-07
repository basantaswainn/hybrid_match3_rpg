import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium shop experience.
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1E1B4B), Color(0xFF312E81), Color(0xFF7C3AED)]),
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
                    const Expanded(child: Text('Shop', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 16),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      FloatingStatChip(icon: Icons.monetization_on, label: 'Coins', value: '1.2k'),
                      SizedBox(width: 10),
                      FloatingStatChip(icon: Icons.diamond_rounded, label: 'Gems', value: '320'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: const [
                      _OfferTile(title: 'Starter Pack', subtitle: '300 coins + 50 gems', accent: AppConstants.gold),
                      _OfferTile(title: 'VIP Pass', subtitle: 'Exclusive rewards all week', accent: AppConstants.primaryCyan),
                      _OfferTile(title: 'Remove Ads', subtitle: 'Ad-free adventure', accent: AppConstants.primaryPink),
                      _OfferTile(title: 'Daily Deal', subtitle: 'Limited time booster bundle', accent: AppConstants.emerald),
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

class _OfferTile extends StatelessWidget {
  const _OfferTile({required this.title, required this.subtitle, required this.accent});

  final String title;
  final String subtitle;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.1),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withValues(alpha: 0.25)),
            child: Icon(Icons.shopping_bag_rounded, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          GamePrimaryButton(label: 'Buy', onPressed: () {}),
        ],
      ),
    );
  }
}
