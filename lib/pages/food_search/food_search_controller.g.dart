// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FoodSearchController)
const foodSearchControllerProvider = FoodSearchControllerProvider._();

final class FoodSearchControllerProvider
    extends $AsyncNotifierProvider<FoodSearchController, List<Food>> {
  const FoodSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodSearchControllerHash();

  @$internal
  @override
  FoodSearchController create() => FoodSearchController();
}

String _$foodSearchControllerHash() =>
    r'f593807f5edc241e9b58b958e86efcb9b1cc00cc';

abstract class _$FoodSearchController extends $AsyncNotifier<List<Food>> {
  FutureOr<List<Food>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Food>>, List<Food>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Food>>, List<Food>>,
              AsyncValue<List<Food>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
