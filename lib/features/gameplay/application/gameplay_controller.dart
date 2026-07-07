import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game/engine/match3_board.dart';

/// Immutable state for the gameplay screen.
class GameplayState {
  const GameplayState({
    required this.board,
    this.selectedCell,
    this.lastMatches = const [],
    this.statusMessage = 'Swap adjacent gems to make a match.',
  });

  final Match3Board board;
  final CellPosition? selectedCell;
  final List<Match3Group> lastMatches;
  final String statusMessage;

  GameplayState copyWith({
    Match3Board? board,
    CellPosition? selectedCell,
    List<Match3Group>? lastMatches,
    String? statusMessage,
  }) {
    return GameplayState(
      board: board ?? this.board,
      selectedCell: selectedCell,
      lastMatches: lastMatches ?? this.lastMatches,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}

/// Riverpod controller that owns gameplay state and core rules.
class GameplayController extends StateNotifier<GameplayState> {
  GameplayController()
      : super(
          GameplayState(
            board: Match3Board(
              initialGrid: List<List<int>>.generate(
                8,
                (_) => List<int>.generate(8, (index) => 1 + (index % 6)),
              ),
            ),
          ),
        );

  void selectCell(int row, int column) {
    final tappedCell = CellPosition(row: row, column: column);
    final currentSelection = state.selectedCell;

    if (currentSelection == null) {
      state = state.copyWith(selectedCell: tappedCell, statusMessage: 'Choose a second gem to swap.');
      return;
    }

    if (currentSelection.row == tappedCell.row && currentSelection.column == tappedCell.column) {
      state = state.copyWith(selectedCell: null, statusMessage: 'Selection cleared.');
      return;
    }

    final swapped = state.board.swap(
      currentSelection.row,
      currentSelection.column,
      tappedCell.row,
      tappedCell.column,
    );

    if (!swapped) {
      state = state.copyWith(selectedCell: tappedCell, statusMessage: 'Only adjacent gems can be swapped.');
      return;
    }

    final matches = state.board.resolveMatches();
    final scoreDelta = matches.fold<int>(0, (sum, match) => sum + match.cells.length * 10);

    state = state.copyWith(
      board: state.board,
      selectedCell: null,
      lastMatches: matches,
      statusMessage: matches.isEmpty
          ? 'No match this turn.'
          : 'Matched ${matches.length} group(s) for $scoreDelta points!',
    );
  }
}

final gameplayControllerProvider = StateNotifierProvider<GameplayController, GameplayState>((ref) {
  return GameplayController();
});
