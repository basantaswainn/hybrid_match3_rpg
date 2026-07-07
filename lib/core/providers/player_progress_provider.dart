import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shared player state used by the home and gameplay screens.
class PlayerProgress {
  const PlayerProgress({
    required this.coins,
    required this.xp,
    required this.level,
    required this.stars,
    required this.unlockedWorlds,
  });

  final int coins;
  final int xp;
  final int level;
  final int stars;
  final int unlockedWorlds;

  PlayerProgress copyWith({
    int? coins,
    int? xp,
    int? level,
    int? stars,
    int? unlockedWorlds,
  }) {
    return PlayerProgress(
      coins: coins ?? this.coins,
      xp: xp ?? this.xp,
      level: level ?? this.level,
      stars: stars ?? this.stars,
      unlockedWorlds: unlockedWorlds ?? this.unlockedWorlds,
    );
  }
}

/// Riverpod notifier that owns the current player profile.
class PlayerProgressNotifier extends StateNotifier<PlayerProgress> {
  PlayerProgressNotifier()
      : super(const PlayerProgress(
          coins: 1500,
          xp: 320,
          level: 7,
          stars: 12,
          unlockedWorlds: 2,
        ));

  void addCoins(int amount) {
    state = state.copyWith(coins: state.coins + amount);
  }

  void addXp(int amount) {
    state = state.copyWith(xp: state.xp + amount);
  }
}

final playerProgressProvider =
    StateNotifierProvider<PlayerProgressNotifier, PlayerProgress>((ref) {
  return PlayerProgressNotifier();
});
