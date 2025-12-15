// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sqfliteModel)
const sqfliteModelProvider = SqfliteModelProvider._();

final class SqfliteModelProvider
    extends $FunctionalProvider<SqfliteModel, SqfliteModel, SqfliteModel>
    with $Provider<SqfliteModel> {
  const SqfliteModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sqfliteModelProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sqfliteModelHash();

  @$internal
  @override
  $ProviderElement<SqfliteModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SqfliteModel create(Ref ref) {
    return sqfliteModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SqfliteModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SqfliteModel>(value),
    );
  }
}

String _$sqfliteModelHash() => r'5b6254e38f20e96b132b7e2db512f74a44cd8538';

@ProviderFor(BrowserViewModel)
const browserViewModelProvider = BrowserViewModelProvider._();

final class BrowserViewModelProvider
    extends $AsyncNotifierProvider<BrowserViewModel, BrowserState> {
  const BrowserViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'browserViewModelProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$browserViewModelHash();

  @$internal
  @override
  BrowserViewModel create() => BrowserViewModel();
}

String _$browserViewModelHash() => r'd93ca0a8fd95982ee745c43b1b722799bc8fae10';

abstract class _$BrowserViewModel extends $AsyncNotifier<BrowserState> {
  FutureOr<BrowserState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BrowserState>, BrowserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<BrowserState>, BrowserState>,
        AsyncValue<BrowserState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
