// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FoodDetailController)
const foodDetailControllerProvider = FoodDetailControllerFamily._();

final class FoodDetailControllerProvider
    extends $AsyncNotifierProvider<FoodDetailController, FatSecretFood> {
  const FoodDetailControllerProvider._({
    required FoodDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'foodDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$foodDetailControllerHash();

  @override
  String toString() {
    return r'foodDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FoodDetailController create() => FoodDetailController();

  @override
  bool operator ==(Object other) {
    return other is FoodDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foodDetailControllerHash() =>
    r'5a653cb52d36cdf5ec2bfea4ebfd0d788ee651b0';

final class FoodDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FoodDetailController,
          AsyncValue<FatSecretFood>,
          FatSecretFood,
          FutureOr<FatSecretFood>,
          String
        > {
  const FoodDetailControllerFamily._()
    : super(
        retry: null,
        name: r'foodDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FoodDetailControllerProvider call(String foodId) =>
      FoodDetailControllerProvider._(argument: foodId, from: this);

  @override
  String toString() => r'foodDetailControllerProvider';
}

abstract class _$FoodDetailController extends $AsyncNotifier<FatSecretFood> {
  late final _$args = ref.$arg as String;
  String get foodId => _$args;

  FutureOr<FatSecretFood> build(String foodId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<FatSecretFood>, FatSecretFood>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FatSecretFood>, FatSecretFood>,
              AsyncValue<FatSecretFood>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
