import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/scoresheet/scoresheet.dart';
import '../../common/scoresheet/scoresheet_card.dart';
import '../../common/target/target.dart';
import '../../util/database/sqflite_model.dart';

part 'browser_viewmodel.g.dart';

@Riverpod(keepAlive: true)
SqfliteModel sqfliteModel(Ref ref) {
  final SqfliteModel model = SqfliteModel();
  ref.onDispose(model.close);
  return model;
}

class BrowserState {
  const BrowserState({
    this.cards = const <ScoresheetCard>[],
    this.hasMore = true,
    this.isLoading = false,
  });

  final List<ScoresheetCard> cards;
  final bool hasMore;
  final bool isLoading;

  BrowserState copyWith({
    List<ScoresheetCard>? cards,
    bool? hasMore,
    bool? isLoading,
  }) =>
      BrowserState(
        cards: cards ?? this.cards,
        hasMore: hasMore ?? this.hasMore,
        isLoading: isLoading ?? this.isLoading,
      );
}

@Riverpod(keepAlive: true)
class BrowserViewModel extends _$BrowserViewModel {
  static const int _pageSize = 10;

  @override
  Future<BrowserState> build() async {
    final SqfliteModel db = ref.watch(sqfliteModelProvider);
    await db.init();
    final List<ScoresheetCard> cards = await db.queryCards(offset: 0, limit: _pageSize);
    return BrowserState(cards: cards, hasMore: cards.length == _pageSize);
  }

  Future<void> refresh() async {
    // Async value is loading only when no cards are cached, otherwise isLoading is set
    state = const AsyncValue<BrowserState>.loading();
    state = await AsyncValue.guard(() async {
      final SqfliteModel db = ref.read(sqfliteModelProvider);
      final List<ScoresheetCard> cards = await db.queryCards(offset: 0, limit: _pageSize);
      return BrowserState(cards: cards, hasMore: cards.length == _pageSize);
    });
  }

  Future<void> loadMore() async {
    final BrowserState? currentState = state.valueOrNull;
    if (currentState == null || currentState.isLoading || !currentState.hasMore) {
      return;
    }

    state = AsyncValue<BrowserState>.data(currentState.copyWith(isLoading: true));

    // Only new cards should be guarded to prevent entire list being lost on error
    final AsyncValue<List<ScoresheetCard>> result = await AsyncValue.guard(() async {
      final SqfliteModel db = ref.read(sqfliteModelProvider);
      final List<ScoresheetCard> newCards =
          await db.queryCards(offset: currentState.cards.length, limit: _pageSize);
      return newCards;
    });

    result.when(
      data: (List<ScoresheetCard> newCards) => state = AsyncValue<BrowserState>.data(
        currentState.copyWith(cards: <ScoresheetCard>[...currentState.cards, ...newCards]),
      ),
      error: (Object error, StackTrace stack) {
        state = AsyncValue<BrowserState>.data(currentState.copyWith(isLoading: false));
        FirebaseCrashlytics.instance.recordError(error, stack);
      },
      loading: () {},
    );
  }

  Future<Scoresheet> queryScoresheet({required int id}) {
    final SqfliteModel db = ref.read(sqfliteModelProvider);
    return db.queryScoresheet(id: id);
  }

  Future<Scoresheet> createScoresheet({
    required String name,
    required Target target,
    required int ends,
    required int shotsPerEnd,
  }) async {
    final SqfliteModel db = ref.watch(sqfliteModelProvider);
    final Scoresheet scoresheet =
        await db.createScoresheet(name: name, target: target, ends: ends, shotsPerEnd: shotsPerEnd);

    await refresh();
    return scoresheet;
  }

  Future<void> updateScoresheet({required Scoresheet scoresheet}) async {
    final SqfliteModel db = ref.watch(sqfliteModelProvider);
    await db.updateScoresheet(scoresheet: scoresheet);

    final BrowserState? currentState = state.valueOrNull;
    if (currentState == null) {
      return;
    }

    final List<ScoresheetCard> updatedCards = currentState.cards.map((ScoresheetCard card) {
      if (card.id == scoresheet.id) {
        return ScoresheetCard(
          id: scoresheet.id,
          name: scoresheet.name,
          target: scoresheet.target,
          ends: scoresheet.ends,
          shotsPerEnd: scoresheet.shotsPerEnd,
        );
      }
      return card;
    }).toList();
    state = AsyncValue<BrowserState>.data(currentState.copyWith(cards: updatedCards));
  }

  Future<void> deleteScoresheet({required int id}) async {
    final SqfliteModel db = ref.watch(sqfliteModelProvider);
    await db.deleteScoresheet(id: id);

    final BrowserState? currentState = state.valueOrNull;
    if (currentState == null) {
      return;
    }

    state = AsyncValue<BrowserState>.data(
      currentState.copyWith(
        cards: currentState.cards.where((ScoresheetCard card) => card.id != id).toList(),
      ),
    );
  }
}
