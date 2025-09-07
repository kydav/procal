// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_state_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FoodSearchStateController)
const foodSearchStateControllerProvider = FoodSearchStateControllerProvider._();

final class FoodSearchStateControllerProvider
    extends $NotifierProvider<FoodSearchStateController, MealState> {
  const FoodSearchStateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foodSearchStateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foodSearchStateControllerHash();

  @$internal
  @override
  FoodSearchStateController create() => FoodSearchStateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealState>(value),
    );
  }
}

String _$foodSearchStateControllerHash() =>
    r'daed71f46bdc4fa5220023b777ff364eaf4bbff0';

abstract class _$FoodSearchStateController extends $Notifier<MealState> {
  MealState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MealState, MealState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MealState, MealState>,
              MealState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
