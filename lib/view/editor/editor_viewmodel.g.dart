// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$averageArrowHash() => r'c2aa9866a7b1584ee41bc4338de11d6070703737';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [averageArrow].
@ProviderFor(averageArrow)
const averageArrowProvider = AverageArrowFamily();

/// See also [averageArrow].
class AverageArrowFamily extends Family<double> {
  /// See also [averageArrow].
  const AverageArrowFamily();

  /// See also [averageArrow].
  AverageArrowProvider call({
    required Scoresheet scoresheet,
  }) {
    return AverageArrowProvider(
      scoresheet: scoresheet,
    );
  }

  @override
  AverageArrowProvider getProviderOverride(
    covariant AverageArrowProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'averageArrowProvider';
}

/// See also [averageArrow].
class AverageArrowProvider extends AutoDisposeProvider<double> {
  /// See also [averageArrow].
  AverageArrowProvider({
    required Scoresheet scoresheet,
  }) : this._internal(
          (ref) => averageArrow(
            ref: ref as AverageArrowRef,
            scoresheet: scoresheet,
          ),
          from: averageArrowProvider,
          name: r'averageArrowProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$averageArrowHash,
          dependencies: AverageArrowFamily._dependencies,
          allTransitiveDependencies: AverageArrowFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
        );

  AverageArrowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
  }) : super.internal();

  final Scoresheet scoresheet;

  @override
  Override overrideWith(
    double Function(AverageArrowRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AverageArrowProvider._internal(
        (ref) => create(ref as AverageArrowRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<double> createElement() {
    return _AverageArrowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AverageArrowProvider && other.scoresheet == scoresheet;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AverageArrowRef on AutoDisposeProviderRef<double> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;
}

class _AverageArrowProviderElement extends AutoDisposeProviderElement<double> with AverageArrowRef {
  _AverageArrowProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as AverageArrowProvider).scoresheet;
}

String _$totalScoreHash() => r'aaab0c4a59002469a462605b54189d37dc65de59';

/// See also [totalScore].
@ProviderFor(totalScore)
const totalScoreProvider = TotalScoreFamily();

/// See also [totalScore].
class TotalScoreFamily extends Family<int> {
  /// See also [totalScore].
  const TotalScoreFamily();

  /// See also [totalScore].
  TotalScoreProvider call({
    required Scoresheet scoresheet,
  }) {
    return TotalScoreProvider(
      scoresheet: scoresheet,
    );
  }

  @override
  TotalScoreProvider getProviderOverride(
    covariant TotalScoreProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'totalScoreProvider';
}

/// See also [totalScore].
class TotalScoreProvider extends AutoDisposeProvider<int> {
  /// See also [totalScore].
  TotalScoreProvider({
    required Scoresheet scoresheet,
  }) : this._internal(
          (ref) => totalScore(
            ref: ref as TotalScoreRef,
            scoresheet: scoresheet,
          ),
          from: totalScoreProvider,
          name: r'totalScoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$totalScoreHash,
          dependencies: TotalScoreFamily._dependencies,
          allTransitiveDependencies: TotalScoreFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
        );

  TotalScoreProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
  }) : super.internal();

  final Scoresheet scoresheet;

  @override
  Override overrideWith(
    int Function(TotalScoreRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TotalScoreProvider._internal(
        (ref) => create(ref as TotalScoreRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _TotalScoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotalScoreProvider && other.scoresheet == scoresheet;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TotalScoreRef on AutoDisposeProviderRef<int> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;
}

class _TotalScoreProviderElement extends AutoDisposeProviderElement<int> with TotalScoreRef {
  _TotalScoreProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as TotalScoreProvider).scoresheet;
}

String _$singleScoreHash() => r'06a5847db5c11f4075ca0cabd8fd7ea82951370e';

/// See also [singleScore].
@ProviderFor(singleScore)
const singleScoreProvider = SingleScoreFamily();

/// See also [singleScore].
class SingleScoreFamily extends Family<int> {
  /// See also [singleScore].
  const SingleScoreFamily();

  /// See also [singleScore].
  SingleScoreProvider call({
    required Scoresheet scoresheet,
    required int score,
  }) {
    return SingleScoreProvider(
      scoresheet: scoresheet,
      score: score,
    );
  }

  @override
  SingleScoreProvider getProviderOverride(
    covariant SingleScoreProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
      score: provider.score,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'singleScoreProvider';
}

/// See also [singleScore].
class SingleScoreProvider extends AutoDisposeProvider<int> {
  /// See also [singleScore].
  SingleScoreProvider({
    required Scoresheet scoresheet,
    required int score,
  }) : this._internal(
          (ref) => singleScore(
            ref: ref as SingleScoreRef,
            scoresheet: scoresheet,
            score: score,
          ),
          from: singleScoreProvider,
          name: r'singleScoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$singleScoreHash,
          dependencies: SingleScoreFamily._dependencies,
          allTransitiveDependencies: SingleScoreFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
          score: score,
        );

  SingleScoreProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
    required this.score,
  }) : super.internal();

  final Scoresheet scoresheet;
  final int score;

  @override
  Override overrideWith(
    int Function(SingleScoreRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleScoreProvider._internal(
        (ref) => create(ref as SingleScoreRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
        score: score,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _SingleScoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleScoreProvider && other.scoresheet == scoresheet && other.score == score;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);
    hash = _SystemHash.combine(hash, score.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SingleScoreRef on AutoDisposeProviderRef<int> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;

  /// The parameter `score` of this provider.
  int get score;
}

class _SingleScoreProviderElement extends AutoDisposeProviderElement<int> with SingleScoreRef {
  _SingleScoreProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as SingleScoreProvider).scoresheet;
  @override
  int get score => (origin as SingleScoreProvider).score;
}

String _$totalScoreEndHash() => r'e59d97f25683606fbbbf62876be559a5a559640d';

/// See also [totalScoreEnd].
@ProviderFor(totalScoreEnd)
const totalScoreEndProvider = TotalScoreEndFamily();

/// See also [totalScoreEnd].
class TotalScoreEndFamily extends Family<int> {
  /// See also [totalScoreEnd].
  const TotalScoreEndFamily();

  /// See also [totalScoreEnd].
  TotalScoreEndProvider call({
    required Scoresheet scoresheet,
    required int endIndex,
  }) {
    return TotalScoreEndProvider(
      scoresheet: scoresheet,
      endIndex: endIndex,
    );
  }

  @override
  TotalScoreEndProvider getProviderOverride(
    covariant TotalScoreEndProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
      endIndex: provider.endIndex,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'totalScoreEndProvider';
}

/// See also [totalScoreEnd].
class TotalScoreEndProvider extends AutoDisposeProvider<int> {
  /// See also [totalScoreEnd].
  TotalScoreEndProvider({
    required Scoresheet scoresheet,
    required int endIndex,
  }) : this._internal(
          (ref) => totalScoreEnd(
            ref: ref as TotalScoreEndRef,
            scoresheet: scoresheet,
            endIndex: endIndex,
          ),
          from: totalScoreEndProvider,
          name: r'totalScoreEndProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$totalScoreEndHash,
          dependencies: TotalScoreEndFamily._dependencies,
          allTransitiveDependencies: TotalScoreEndFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
          endIndex: endIndex,
        );

  TotalScoreEndProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
    required this.endIndex,
  }) : super.internal();

  final Scoresheet scoresheet;
  final int endIndex;

  @override
  Override overrideWith(
    int Function(TotalScoreEndRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TotalScoreEndProvider._internal(
        (ref) => create(ref as TotalScoreEndRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
        endIndex: endIndex,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _TotalScoreEndProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotalScoreEndProvider &&
        other.scoresheet == scoresheet &&
        other.endIndex == endIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);
    hash = _SystemHash.combine(hash, endIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TotalScoreEndRef on AutoDisposeProviderRef<int> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;

  /// The parameter `endIndex` of this provider.
  int get endIndex;
}

class _TotalScoreEndProviderElement extends AutoDisposeProviderElement<int> with TotalScoreEndRef {
  _TotalScoreEndProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as TotalScoreEndProvider).scoresheet;
  @override
  int get endIndex => (origin as TotalScoreEndProvider).endIndex;
}

String _$singleScoreEndHash() => r'd0814adb44ee03f99ee68adc1ac9b7e9abc1a924';

/// See also [singleScoreEnd].
@ProviderFor(singleScoreEnd)
const singleScoreEndProvider = SingleScoreEndFamily();

/// See also [singleScoreEnd].
class SingleScoreEndFamily extends Family<int> {
  /// See also [singleScoreEnd].
  const SingleScoreEndFamily();

  /// See also [singleScoreEnd].
  SingleScoreEndProvider call({
    required Scoresheet scoresheet,
    required int score,
    required int endIndex,
  }) {
    return SingleScoreEndProvider(
      scoresheet: scoresheet,
      score: score,
      endIndex: endIndex,
    );
  }

  @override
  SingleScoreEndProvider getProviderOverride(
    covariant SingleScoreEndProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
      score: provider.score,
      endIndex: provider.endIndex,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'singleScoreEndProvider';
}

/// See also [singleScoreEnd].
class SingleScoreEndProvider extends AutoDisposeProvider<int> {
  /// See also [singleScoreEnd].
  SingleScoreEndProvider({
    required Scoresheet scoresheet,
    required int score,
    required int endIndex,
  }) : this._internal(
          (ref) => singleScoreEnd(
            ref: ref as SingleScoreEndRef,
            scoresheet: scoresheet,
            score: score,
            endIndex: endIndex,
          ),
          from: singleScoreEndProvider,
          name: r'singleScoreEndProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$singleScoreEndHash,
          dependencies: SingleScoreEndFamily._dependencies,
          allTransitiveDependencies: SingleScoreEndFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
          score: score,
          endIndex: endIndex,
        );

  SingleScoreEndProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
    required this.score,
    required this.endIndex,
  }) : super.internal();

  final Scoresheet scoresheet;
  final int score;
  final int endIndex;

  @override
  Override overrideWith(
    int Function(SingleScoreEndRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleScoreEndProvider._internal(
        (ref) => create(ref as SingleScoreEndRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
        score: score,
        endIndex: endIndex,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _SingleScoreEndProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleScoreEndProvider &&
        other.scoresheet == scoresheet &&
        other.score == score &&
        other.endIndex == endIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);
    hash = _SystemHash.combine(hash, score.hashCode);
    hash = _SystemHash.combine(hash, endIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SingleScoreEndRef on AutoDisposeProviderRef<int> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;

  /// The parameter `score` of this provider.
  int get score;

  /// The parameter `endIndex` of this provider.
  int get endIndex;
}

class _SingleScoreEndProviderElement extends AutoDisposeProviderElement<int>
    with SingleScoreEndRef {
  _SingleScoreEndProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as SingleScoreEndProvider).scoresheet;
  @override
  int get score => (origin as SingleScoreEndProvider).score;
  @override
  int get endIndex => (origin as SingleScoreEndProvider).endIndex;
}

String _$editorEndHash() => r'6ad06ca0951e5e8acf93faa70a8e8f602b691fbb';

/// See also [editorEnd].
@ProviderFor(editorEnd)
const editorEndProvider = EditorEndFamily();

/// See also [editorEnd].
class EditorEndFamily extends Family<List<int>> {
  /// See also [editorEnd].
  const EditorEndFamily();

  /// See also [editorEnd].
  EditorEndProvider call({
    required Scoresheet scoresheet,
    required int endIndex,
  }) {
    return EditorEndProvider(
      scoresheet: scoresheet,
      endIndex: endIndex,
    );
  }

  @override
  EditorEndProvider getProviderOverride(
    covariant EditorEndProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
      endIndex: provider.endIndex,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'editorEndProvider';
}

/// See also [editorEnd].
class EditorEndProvider extends AutoDisposeProvider<List<int>> {
  /// See also [editorEnd].
  EditorEndProvider({
    required Scoresheet scoresheet,
    required int endIndex,
  }) : this._internal(
          (ref) => editorEnd(
            ref: ref as EditorEndRef,
            scoresheet: scoresheet,
            endIndex: endIndex,
          ),
          from: editorEndProvider,
          name: r'editorEndProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$editorEndHash,
          dependencies: EditorEndFamily._dependencies,
          allTransitiveDependencies: EditorEndFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
          endIndex: endIndex,
        );

  EditorEndProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
    required this.endIndex,
  }) : super.internal();

  final Scoresheet scoresheet;
  final int endIndex;

  @override
  Override overrideWith(
    List<int> Function(EditorEndRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditorEndProvider._internal(
        (ref) => create(ref as EditorEndRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
        endIndex: endIndex,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<int>> createElement() {
    return _EditorEndProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditorEndProvider &&
        other.scoresheet == scoresheet &&
        other.endIndex == endIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);
    hash = _SystemHash.combine(hash, endIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EditorEndRef on AutoDisposeProviderRef<List<int>> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;

  /// The parameter `endIndex` of this provider.
  int get endIndex;
}

class _EditorEndProviderElement extends AutoDisposeProviderElement<List<int>> with EditorEndRef {
  _EditorEndProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as EditorEndProvider).scoresheet;
  @override
  int get endIndex => (origin as EditorEndProvider).endIndex;
}

String _$editorViewModelHash() => r'f6e1b14943ef618728ad125e85b83f0465d535da';

abstract class _$EditorViewModel extends BuildlessAutoDisposeNotifier<Scoresheet> {
  late final Scoresheet scoresheet;

  Scoresheet build({
    required Scoresheet scoresheet,
  });
}

/// See also [EditorViewModel].
@ProviderFor(EditorViewModel)
const editorViewModelProvider = EditorViewModelFamily();

/// See also [EditorViewModel].
class EditorViewModelFamily extends Family<Scoresheet> {
  /// See also [EditorViewModel].
  const EditorViewModelFamily();

  /// See also [EditorViewModel].
  EditorViewModelProvider call({
    required Scoresheet scoresheet,
  }) {
    return EditorViewModelProvider(
      scoresheet: scoresheet,
    );
  }

  @override
  EditorViewModelProvider getProviderOverride(
    covariant EditorViewModelProvider provider,
  ) {
    return call(
      scoresheet: provider.scoresheet,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'editorViewModelProvider';
}

/// See also [EditorViewModel].
class EditorViewModelProvider extends AutoDisposeNotifierProviderImpl<EditorViewModel, Scoresheet> {
  /// See also [EditorViewModel].
  EditorViewModelProvider({
    required Scoresheet scoresheet,
  }) : this._internal(
          () => EditorViewModel()..scoresheet = scoresheet,
          from: editorViewModelProvider,
          name: r'editorViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$editorViewModelHash,
          dependencies: EditorViewModelFamily._dependencies,
          allTransitiveDependencies: EditorViewModelFamily._allTransitiveDependencies,
          scoresheet: scoresheet,
        );

  EditorViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scoresheet,
  }) : super.internal();

  final Scoresheet scoresheet;

  @override
  Scoresheet runNotifierBuild(
    covariant EditorViewModel notifier,
  ) {
    return notifier.build(
      scoresheet: scoresheet,
    );
  }

  @override
  Override overrideWith(EditorViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditorViewModelProvider._internal(
        () => create()..scoresheet = scoresheet,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scoresheet: scoresheet,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EditorViewModel, Scoresheet> createElement() {
    return _EditorViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider && other.scoresheet == scoresheet;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scoresheet.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EditorViewModelRef on AutoDisposeNotifierProviderRef<Scoresheet> {
  /// The parameter `scoresheet` of this provider.
  Scoresheet get scoresheet;
}

class _EditorViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<EditorViewModel, Scoresheet>
    with EditorViewModelRef {
  _EditorViewModelProviderElement(super.provider);

  @override
  Scoresheet get scoresheet => (origin as EditorViewModelProvider).scoresheet;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
