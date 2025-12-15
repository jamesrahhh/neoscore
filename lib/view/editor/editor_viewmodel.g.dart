// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditorViewModel)
const editorViewModelProvider = EditorViewModelFamily._();

final class EditorViewModelProvider
    extends $NotifierProvider<EditorViewModel, Scoresheet> {
  const EditorViewModelProvider._(
      {required EditorViewModelFamily super.from,
      required Scoresheet super.argument})
      : super(
          retry: null,
          name: r'editorViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$editorViewModelHash();

  @override
  String toString() {
    return r'editorViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EditorViewModel create() => EditorViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Scoresheet value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Scoresheet>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editorViewModelHash() => r'50789bd7bc3f1e09c0f62fcf9de6d6d31a3a5b37';

final class EditorViewModelFamily extends $Family
    with
        $ClassFamilyOverride<EditorViewModel, Scoresheet, Scoresheet,
            Scoresheet, Scoresheet> {
  const EditorViewModelFamily._()
      : super(
          retry: null,
          name: r'editorViewModelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  EditorViewModelProvider call({
    required Scoresheet scoresheet,
  }) =>
      EditorViewModelProvider._(argument: scoresheet, from: this);

  @override
  String toString() => r'editorViewModelProvider';
}

abstract class _$EditorViewModel extends $Notifier<Scoresheet> {
  late final _$args = ref.$arg as Scoresheet;
  Scoresheet get scoresheet => _$args;

  Scoresheet build({
    required Scoresheet scoresheet,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      scoresheet: _$args,
    );
    final ref = this.ref as $Ref<Scoresheet, Scoresheet>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Scoresheet, Scoresheet>, Scoresheet, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(averageArrow)
const averageArrowProvider = AverageArrowFamily._();

final class AverageArrowProvider
    extends $FunctionalProvider<double, double, double> with $Provider<double> {
  const AverageArrowProvider._(
      {required AverageArrowFamily super.from,
      required Scoresheet super.argument})
      : super(
          retry: null,
          name: r'averageArrowProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$averageArrowHash();

  @override
  String toString() {
    return r'averageArrowProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as Scoresheet;
    return averageArrow(
      ref,
      scoresheet: argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AverageArrowProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$averageArrowHash() => r'175f3fb8610a95d6a697bb6ff32de97920030317';

final class AverageArrowFamily extends $Family
    with $FunctionalFamilyOverride<double, Scoresheet> {
  const AverageArrowFamily._()
      : super(
          retry: null,
          name: r'averageArrowProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AverageArrowProvider call({
    required Scoresheet scoresheet,
  }) =>
      AverageArrowProvider._(argument: scoresheet, from: this);

  @override
  String toString() => r'averageArrowProvider';
}

@ProviderFor(totalScore)
const totalScoreProvider = TotalScoreFamily._();

final class TotalScoreProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const TotalScoreProvider._(
      {required TotalScoreFamily super.from,
      required Scoresheet super.argument})
      : super(
          retry: null,
          name: r'totalScoreProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$totalScoreHash();

  @override
  String toString() {
    return r'totalScoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as Scoresheet;
    return totalScore(
      ref,
      scoresheet: argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TotalScoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$totalScoreHash() => r'0f29ce523798567bf5426d0a22bba8632e73c99c';

final class TotalScoreFamily extends $Family
    with $FunctionalFamilyOverride<int, Scoresheet> {
  const TotalScoreFamily._()
      : super(
          retry: null,
          name: r'totalScoreProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TotalScoreProvider call({
    required Scoresheet scoresheet,
  }) =>
      TotalScoreProvider._(argument: scoresheet, from: this);

  @override
  String toString() => r'totalScoreProvider';
}

@ProviderFor(singleScore)
const singleScoreProvider = SingleScoreFamily._();

final class SingleScoreProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const SingleScoreProvider._(
      {required SingleScoreFamily super.from,
      required ({
        Scoresheet scoresheet,
        int score,
      })
          super.argument})
      : super(
          retry: null,
          name: r'singleScoreProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$singleScoreHash();

  @override
  String toString() {
    return r'singleScoreProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as ({
      Scoresheet scoresheet,
      int score,
    });
    return singleScore(
      ref,
      scoresheet: argument.scoresheet,
      score: argument.score,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SingleScoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleScoreHash() => r'be6f82fb04100ed5dbe48bfa01fc24f2eb596240';

final class SingleScoreFamily extends $Family
    with
        $FunctionalFamilyOverride<
            int,
            ({
              Scoresheet scoresheet,
              int score,
            })> {
  const SingleScoreFamily._()
      : super(
          retry: null,
          name: r'singleScoreProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SingleScoreProvider call({
    required Scoresheet scoresheet,
    required int score,
  }) =>
      SingleScoreProvider._(argument: (
        scoresheet: scoresheet,
        score: score,
      ), from: this);

  @override
  String toString() => r'singleScoreProvider';
}

@ProviderFor(totalScoreEnd)
const totalScoreEndProvider = TotalScoreEndFamily._();

final class TotalScoreEndProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const TotalScoreEndProvider._(
      {required TotalScoreEndFamily super.from,
      required ({
        Scoresheet scoresheet,
        int endIndex,
      })
          super.argument})
      : super(
          retry: null,
          name: r'totalScoreEndProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$totalScoreEndHash();

  @override
  String toString() {
    return r'totalScoreEndProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as ({
      Scoresheet scoresheet,
      int endIndex,
    });
    return totalScoreEnd(
      ref,
      scoresheet: argument.scoresheet,
      endIndex: argument.endIndex,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TotalScoreEndProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$totalScoreEndHash() => r'6960dc830aa848846cc92cf122fbcc03145ed690';

final class TotalScoreEndFamily extends $Family
    with
        $FunctionalFamilyOverride<
            int,
            ({
              Scoresheet scoresheet,
              int endIndex,
            })> {
  const TotalScoreEndFamily._()
      : super(
          retry: null,
          name: r'totalScoreEndProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TotalScoreEndProvider call({
    required Scoresheet scoresheet,
    required int endIndex,
  }) =>
      TotalScoreEndProvider._(argument: (
        scoresheet: scoresheet,
        endIndex: endIndex,
      ), from: this);

  @override
  String toString() => r'totalScoreEndProvider';
}

@ProviderFor(singleScoreEnd)
const singleScoreEndProvider = SingleScoreEndFamily._();

final class SingleScoreEndProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const SingleScoreEndProvider._(
      {required SingleScoreEndFamily super.from,
      required ({
        Scoresheet scoresheet,
        int score,
        int endIndex,
      })
          super.argument})
      : super(
          retry: null,
          name: r'singleScoreEndProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$singleScoreEndHash();

  @override
  String toString() {
    return r'singleScoreEndProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as ({
      Scoresheet scoresheet,
      int score,
      int endIndex,
    });
    return singleScoreEnd(
      ref,
      scoresheet: argument.scoresheet,
      score: argument.score,
      endIndex: argument.endIndex,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SingleScoreEndProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleScoreEndHash() => r'e11a9207ede1d7a4dd9a8f49003df07c4708ae5d';

final class SingleScoreEndFamily extends $Family
    with
        $FunctionalFamilyOverride<
            int,
            ({
              Scoresheet scoresheet,
              int score,
              int endIndex,
            })> {
  const SingleScoreEndFamily._()
      : super(
          retry: null,
          name: r'singleScoreEndProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SingleScoreEndProvider call({
    required Scoresheet scoresheet,
    required int score,
    required int endIndex,
  }) =>
      SingleScoreEndProvider._(argument: (
        scoresheet: scoresheet,
        score: score,
        endIndex: endIndex,
      ), from: this);

  @override
  String toString() => r'singleScoreEndProvider';
}

@ProviderFor(editorEnd)
const editorEndProvider = EditorEndFamily._();

final class EditorEndProvider
    extends $FunctionalProvider<List<int>, List<int>, List<int>>
    with $Provider<List<int>> {
  const EditorEndProvider._(
      {required EditorEndFamily super.from,
      required ({
        Scoresheet scoresheet,
        int endIndex,
      })
          super.argument})
      : super(
          retry: null,
          name: r'editorEndProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$editorEndHash();

  @override
  String toString() {
    return r'editorEndProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<int> create(Ref ref) {
    final argument = this.argument as ({
      Scoresheet scoresheet,
      int endIndex,
    });
    return editorEnd(
      ref,
      scoresheet: argument.scoresheet,
      endIndex: argument.endIndex,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditorEndProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editorEndHash() => r'e0dd28ce7bb771282cbe0ff49e711d1716ef023d';

final class EditorEndFamily extends $Family
    with
        $FunctionalFamilyOverride<
            List<int>,
            ({
              Scoresheet scoresheet,
              int endIndex,
            })> {
  const EditorEndFamily._()
      : super(
          retry: null,
          name: r'editorEndProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  EditorEndProvider call({
    required Scoresheet scoresheet,
    required int endIndex,
  }) =>
      EditorEndProvider._(argument: (
        scoresheet: scoresheet,
        endIndex: endIndex,
      ), from: this);

  @override
  String toString() => r'editorEndProvider';
}
