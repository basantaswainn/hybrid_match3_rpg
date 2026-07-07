import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/game_widgets.dart';

/// Premium settings screen.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF111827), Color(0xFF334155), Color(0xFF475569)]),
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
                    const Expanded(child: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800))),
                  ],
                ),
                const SizedBox(height: 18),
                GameGlassCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      _SettingRow(title: 'Music', value: 'On'),
                      Divider(color: Colors.white24),
                      _SettingRow(title: 'Sound', value: 'On'),
                      Divider(color: Colors.white24),
                      _SettingRow(title: 'Vibration', value: 'On'),
                      Divider(color: Colors.white24),
                      _SettingRow(title: 'Graphics', value: 'High'),
                      Divider(color: Colors.white24),
                      _SettingRow(title: 'Privacy Policy', value: 'Open'),
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

class _SettingRow extends StatelessWidget {
  const _SettingRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), color: AppConstants.primaryPurple.withValues(alpha: 0.2)),
            child: Text(value, style: const TextStyle(color: AppConstants.primaryCyan, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
