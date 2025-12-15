// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavigationViewModel)
const navigationViewModelProvider = NavigationViewModelProvider._();

final class NavigationViewModelProvider
    extends $NotifierProvider<NavigationViewModel, int> {
  const NavigationViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'navigationViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$navigationViewModelHash();

  @$internal
  @override
  NavigationViewModel create() => NavigationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$navigationViewModelHash() =>
    r'9c7c6c1f281c7aca7150b327d5a6790df07af5cb';

abstract class _$NavigationViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
