import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/scoresheet/scoresheet.dart';

part 'editor_viewmodel.g.dart';

@riverpod
class EditorViewModel extends _$EditorViewModel {
  @override
  Scoresheet build({required Scoresheet scoresheet}) => scoresheet;

  void addScore({required int endIndex, required int score}) {
    final List<List<int>> arrows = List<List<int>>.from(state.arrows);
    while (endIndex >= arrows.length) {
      arrows.add(<int>[]);
    }
    if (arrows[endIndex].length >= state.shotsPerEnd) {
      return;
    }
    arrows[endIndex]
      ..add(score)
      ..sort((int a, int b) => b.compareTo(a));
    state = state.copyWith(arrows: arrows);
  }

  void deleteScore({required int endIndex}) {
    final List<List<int>> arrows = List<List<int>>.from(state.arrows);
    if (endIndex >= arrows.length || arrows[endIndex].isEmpty) {
      return;
    }
    arrows[endIndex].removeLast();
    state = state.copyWith(arrows: arrows);
  }

  double getAverageArrow() {
    int arrowCount = 0;
    double total = 0;
    for (final List<int> end in state.arrows) {
      for (final int score in end) {
        arrowCount++;
        total += min(score, state.target.highestScore);
      }
    }

    return arrowCount == 0 ? 0 : total / arrowCount;
  }

  int getTotalScoreEnd({required int endIndex}) {
    if (endIndex >= state.arrows.length) {
      return 0;
    }

    return state.arrows[endIndex]
        .fold(0, (int total, int shot) => total + min(shot, state.target.highestScore));
  }

  int getSingleScoreEnd({required int endIndex, required int score}) {
    if (endIndex >= state.arrows.length) {
      return 0;
    }
    return state.arrows[endIndex].where((int shot) => shot == score).length;
  }

  int get getTotalScore => state.arrows.fold(
        0,
        (int total, List<int> end) =>
            total +
            end.fold(0, (int total, int shot) => total + min(shot, state.target.highestScore)),
      );

  int getSingleScore({required int score}) => state.arrows
      .fold(0, (int total, List<int> end) => total + end.where((int shot) => shot == score).length);

  List<int> getEnd(int endIndex) =>
      endIndex >= state.arrows.length ? <int>[] : state.arrows[endIndex];
}

@riverpod
double averageArrow({required Ref ref, required Scoresheet scoresheet}) {
  ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return ref.watch(editorViewModelProvider(scoresheet: scoresheet).notifier).getAverageArrow();
}

@riverpod
int totalScore({required Ref ref, required Scoresheet scoresheet}) {
  ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return ref.watch(editorViewModelProvider(scoresheet: scoresheet).notifier).getTotalScore;
}

@riverpod
int singleScore({required Ref ref, required Scoresheet scoresheet, required int score}) {
  ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return ref
      .watch(editorViewModelProvider(scoresheet: scoresheet).notifier)
      .getSingleScore(score: score);
}

@riverpod
int totalScoreEnd({required Ref ref, required Scoresheet scoresheet, required int endIndex}) {
  ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return ref
      .watch(editorViewModelProvider(scoresheet: scoresheet).notifier)
      .getTotalScoreEnd(endIndex: endIndex);
}

@riverpod
int singleScoreEnd({
  required Ref ref,
  required Scoresheet scoresheet,
  required int score,
  required int endIndex,
}) {
  ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return ref
      .watch(editorViewModelProvider(scoresheet: scoresheet).notifier)
      .getSingleScoreEnd(score: score, endIndex: endIndex);
}

@riverpod
List<int> editorEnd({required Ref ref, required Scoresheet scoresheet, required int endIndex}) {
  final Scoresheet state = ref.watch(editorViewModelProvider(scoresheet: scoresheet));
  return endIndex >= state.arrows.length ? <int>[] : state.arrows[endIndex];
}
