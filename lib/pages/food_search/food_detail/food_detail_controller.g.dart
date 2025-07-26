// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodDetailControllerHash() =>
    r'5a653cb52d36cdf5ec2bfea4ebfd0d788ee651b0';

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

abstract class _$FoodDetailController
    extends BuildlessAutoDisposeAsyncNotifier<FatSecretFood> {
  late final String foodId;

  FutureOr<FatSecretFood> build(String foodId);
}

/// See also [FoodDetailController].
@ProviderFor(FoodDetailController)
const foodDetailControllerProvider = FoodDetailControllerFamily();

/// See also [FoodDetailController].
class FoodDetailControllerFamily extends Family<AsyncValue<FatSecretFood>> {
  /// See also [FoodDetailController].
  const FoodDetailControllerFamily();

  /// See also [FoodDetailController].
  FoodDetailControllerProvider call(String foodId) {
    return FoodDetailControllerProvider(foodId);
  }

  @override
  FoodDetailControllerProvider getProviderOverride(
    covariant FoodDetailControllerProvider provider,
  ) {
    return call(provider.foodId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'foodDetailControllerProvider';
}

/// See also [FoodDetailController].
class FoodDetailControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          FoodDetailController,
          FatSecretFood
        > {
  /// See also [FoodDetailController].
  FoodDetailControllerProvider(String foodId)
    : this._internal(
        () => FoodDetailController()..foodId = foodId,
        from: foodDetailControllerProvider,
        name: r'foodDetailControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$foodDetailControllerHash,
        dependencies: FoodDetailControllerFamily._dependencies,
        allTransitiveDependencies:
            FoodDetailControllerFamily._allTransitiveDependencies,
        foodId: foodId,
      );

  FoodDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.foodId,
  }) : super.internal();

  final String foodId;

  @override
  FutureOr<FatSecretFood> runNotifierBuild(
    covariant FoodDetailController notifier,
  ) {
    return notifier.build(foodId);
  }

  @override
  Override overrideWith(FoodDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FoodDetailControllerProvider._internal(
        () => create()..foodId = foodId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        foodId: foodId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FoodDetailController, FatSecretFood>
  createElement() {
    return _FoodDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodDetailControllerProvider && other.foodId == foodId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, foodId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FoodDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<FatSecretFood> {
  /// The parameter `foodId` of this provider.
  String get foodId;
}

class _FoodDetailControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          FoodDetailController,
          FatSecretFood
        >
    with FoodDetailControllerRef {
  _FoodDetailControllerProviderElement(super.provider);

  @override
  String get foodId => (origin as FoodDetailControllerProvider).foodId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
