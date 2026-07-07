import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game/engine/treasure_legends_game.dart';
import '../application/gameplay_controller.dart';

/// The main gameplay screen that presents the board and the Flame shell.
class GameplayScreen extends ConsumerWidget {
  const GameplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameplayState = ref.watch(gameplayControllerProvider);
    final board = gameplayState.board;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Treasure Legends'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('Score ${board.score}')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: GameWidget(game: TreasureLegendsGame(board: board)),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(gameplayState.statusMessage),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: board.rows * board.columns,
                itemBuilder: (context, index) {
                  final row = index ~/ board.columns;
                  final column = index % board.columns;
                  final gemType = board.grid[row][column];
                  return GestureDetector(
                    onTap: () => ref.read(gameplayControllerProvider.notifier).selectCell(row, column),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _gemColor(gemType),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          gemType == 0 ? '•' : '',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _gemColor(int gemType) {
    switch (gemType) {
      case 1:
        return const Color(0xFFFF4D6D);
      case 2:
        return const Color(0xFF4DA3FF);
      case 3:
        return const Color(0xFF46D0A0);
      case 4:
        return const Color(0xFFFFD166);
      case 5:
        return const Color(0xFFB388FF);
      default:
        return const Color(0xFFFF8C42);
    }
  }
}
