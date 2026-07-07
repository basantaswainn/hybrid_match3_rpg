import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'match3_board.dart';

/// A simple Flame-based shell for the gameplay experience.
class TreasureLegendsGame extends FlameGame {
  TreasureLegendsGame({required this.board});

  final Match3Board board;

  @override
  Future<void> onLoad() async {
    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF1A1233),
      ),
    );

    add(
      TextComponent(
        text: 'Treasure Legends',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        position: Vector2(24, 24),
      ),
    );

    add(
      RectangleComponent(
        position: Vector2(24, 80),
        size: Vector2(320, 320),
        paint: Paint()..color = const Color(0xFF2E2150),
      ),
    );
  }
}
