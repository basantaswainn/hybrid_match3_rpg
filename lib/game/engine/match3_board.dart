import 'dart:math';

/// A lightweight match-3 engine used by the gameplay screen and tests.
///
/// The board is intentionally data-driven and framework-agnostic so that it can
/// be reused by both Flutter widgets and a Flame-based presentation layer.
class Match3Board {
  Match3Board({List<List<int>>? initialGrid, int rows = 8, int columns = 8})
      : rows = initialGrid?.length ?? rows,
        columns = initialGrid != null && initialGrid.isNotEmpty
            ? initialGrid.first.length
            : columns,
        _grid = _buildGrid(
          initialGrid,
          initialGrid?.length ?? rows,
          initialGrid != null && initialGrid.isNotEmpty
              ? initialGrid.first.length
              : columns,
        ) {
    if (initialGrid != null && initialGrid.isNotEmpty) {
      final rowLengths = initialGrid.map((row) => row.length).toSet();
      if (rowLengths.length != 1) {
        throw ArgumentError('All rows in the initial grid must have the same length.');
      }
    }
  }

  final int rows;
  final int columns;

  final List<List<int>> _grid;
  int _score = 0;

  List<List<int>> get grid => _grid;

  int get score => _score;

  /// Returns all matches detected on the current board.
  List<Match3Group> findMatches() {
    final groups = <Match3Group>[];
    final seen = <String>{};

    for (var row = 0; row < rows; row++) {
      var runStart = 0;
      for (var column = 1; column <= columns; column++) {
        final isLastValue = column == columns;
        final sameGem = !isLastValue && _grid[row][column] == _grid[row][column - 1];
        if (!sameGem || isLastValue) {
          final length = column - runStart;
          if (length >= 3) {
            final positions = List<CellPosition>.generate(
              length,
              (index) => CellPosition(row: row, column: runStart + index),
            );
            final signature = positions.map((cell) => '${cell.row}:${cell.column}').join('|');
            if (!seen.contains(signature)) {
              seen.add(signature);
              groups.add(Match3Group(gemType: _grid[row][runStart], cells: positions));
            }
          }
          runStart = column;
        }
      }
    }

    for (var column = 0; column < columns; column++) {
      var runStart = 0;
      for (var row = 1; row <= rows; row++) {
        final isLastValue = row == rows;
        final sameGem = !isLastValue && _grid[row][column] == _grid[row - 1][column];
        if (!sameGem || isLastValue) {
          final length = row - runStart;
          if (length >= 3) {
            final positions = List<CellPosition>.generate(
              length,
              (index) => CellPosition(row: runStart + index, column: column),
            );
            final signature = positions.map((cell) => '${cell.row}:${cell.column}').join('|');
            if (!seen.contains(signature)) {
              seen.add(signature);
              groups.add(Match3Group(gemType: _grid[runStart][column], cells: positions));
            }
          }
          runStart = row;
        }
      }
    }

    return groups;
  }

  /// Swaps two adjacent cells.
  bool swap(int rowA, int columnA, int rowB, int columnB) {
    if (!_isInBounds(rowA, columnA) || !_isInBounds(rowB, columnB)) {
      return false;
    }

    final adjacent = (rowA == rowB && (columnA - columnB).abs() == 1) ||
        (columnA == columnB && (rowA - rowB).abs() == 1);
    if (!adjacent) {
      return false;
    }

    final temp = _grid[rowA][columnA];
    _grid[rowA][columnA] = _grid[rowB][columnB];
    _grid[rowB][columnB] = temp;
    return true;
  }

  /// Removes all current matches, collapses the board and refills it.
  List<Match3Group> resolveMatches() {
    final resolvedMatches = <Match3Group>[];

    while (true) {
      final matches = findMatches();
      if (matches.isEmpty) {
        break;
      }

      for (final match in matches) {
        resolvedMatches.add(match);
        _score += match.cells.length * 10;
        for (final cell in match.cells) {
          _grid[cell.row][cell.column] = 0;
        }
      }
      _collapseBoard();
      _refillBoard();
    }

    return resolvedMatches;
  }

  static List<List<int>> _buildGrid(
    List<List<int>>? initialGrid,
    int rows,
    int columns,
  ) {
    if (initialGrid != null) {
      return initialGrid.map((row) => List<int>.from(row)).toList(growable: false);
    }

    return List<List<int>>.generate(
      rows,
      (_) => List<int>.generate(columns, (_) => _randomGemValue()),
      growable: false,
    );
  }

  void _collapseBoard() {
    for (var column = 0; column < columns; column++) {
      var writeRow = rows - 1;
      for (var row = rows - 1; row >= 0; row--) {
        final value = _grid[row][column];
        if (value != 0) {
          _grid[writeRow][column] = value;
          writeRow--;
        }
      }
      while (writeRow >= 0) {
        _grid[writeRow][column] = 0;
        writeRow--;
      }
    }
  }

  void _refillBoard() {
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        if (_grid[row][column] == 0) {
          _grid[row][column] = _randomGemValue();
        }
      }
    }
  }

  bool _isInBounds(int row, int column) {
    return row >= 0 && row < rows && column >= 0 && column < columns;
  }

  static int _randomGemValue() => 1 + Random().nextInt(6);
}

/// A single contiguous match on the board.
class Match3Group {
  const Match3Group({required this.gemType, required this.cells});

  final int gemType;
  final List<CellPosition> cells;
}

/// A single tile coordinate.
class CellPosition {
  const CellPosition({required this.row, required this.column});

  final int row;
  final int column;
}
