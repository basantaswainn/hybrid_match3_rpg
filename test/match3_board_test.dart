import 'package:flutter_test/flutter_test.dart';
import 'package:hybrid_match3_rpg/game/engine/match3_board.dart';

void main() {
  group('Match3Board', () {
    test('finds horizontal matches of three or more gems', () {
      final board = Match3Board(
        initialGrid: [
          [1, 1, 1, 2, 2, 2],
          [3, 4, 5, 6, 7, 8],
          [1, 2, 3, 4, 5, 6],
        ],
      );

      final matches = board.findMatches();

      expect(matches, isNotEmpty);
      expect(matches.first.cells.length, greaterThanOrEqualTo(3));
    });

    test('swapping two gems creates a match and applies the swap', () {
      final board = Match3Board(
        initialGrid: [
          [1, 2, 3, 4, 5, 6],
          [1, 2, 3, 4, 5, 6],
          [1, 2, 3, 4, 5, 6],
        ],
      );

      final changed = board.swap(0, 0, 0, 1);

      expect(changed, isTrue);
      expect(board.grid[0][0], 2);
      expect(board.grid[0][1], 1);
      expect(board.findMatches(), isNotEmpty);
    });
  });
}
