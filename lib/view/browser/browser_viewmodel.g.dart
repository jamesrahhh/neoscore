// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sqfliteModelHash() => r'5b6254e38f20e96b132b7e2db512f74a44cd8538';

/// See also [sqfliteModel].
@ProviderFor(sqfliteModel)
final sqfliteModelProvider = Provider<SqfliteModel>.internal(
  sqfliteModel,
  name: r'sqfliteModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sqfliteModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SqfliteModelRef = ProviderRef<SqfliteModel>;
String _$browserViewModelHash() => r'5281947f1e35d6f12ffa1cd96666684e9e3060a6';

/// See also [BrowserViewModel].
@ProviderFor(BrowserViewModel)
final browserViewModelProvider =
    AsyncNotifierProvider<BrowserViewModel, BrowserState>.internal(
  BrowserViewModel.new,
  name: r'browserViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$browserViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BrowserViewModel = AsyncNotifier<BrowserState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
