// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FoodDetailController)
const foodDetailControllerProvider = FoodDetailControllerFamily._();

final class FoodDetailControllerProvider
    extends $AsyncNotifierProvider<FoodDetailController, FatSecretFood> {
  const FoodDetailControllerProvider._({
    required FoodDetailControllerFamily super.from,
    required ({String foodId, bool isBarcode}) super.argument,
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
        '$argument';
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
    r'e5722d7c47f297d70cc72f2b4b4d22a483dcaf5d';

final class FoodDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FoodDetailController,
          AsyncValue<FatSecretFood>,
          FatSecretFood,
          FutureOr<FatSecretFood>,
          ({String foodId, bool isBarcode})
        > {
  const FoodDetailControllerFamily._()
    : super(
        retry: null,
        name: r'foodDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FoodDetailControllerProvider call({
    required String foodId,
    bool isBarcode = false,
  }) => FoodDetailControllerProvider._(
    argument: (foodId: foodId, isBarcode: isBarcode),
    from: this,
  );

  @override
  String toString() => r'foodDetailControllerProvider';
}

abstract class _$FoodDetailController extends $AsyncNotifier<FatSecretFood> {
  late final _$args = ref.$arg as ({String foodId, bool isBarcode});
  String get foodId => _$args.foodId;
  bool get isBarcode => _$args.isBarcode;

  FutureOr<FatSecretFood> build({
    required String foodId,
    bool isBarcode = false,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(foodId: _$args.foodId, isBarcode: _$args.isBarcode);
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
