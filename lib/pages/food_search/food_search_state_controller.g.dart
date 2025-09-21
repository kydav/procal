// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_state_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
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
    r'314fb029bb3dead87e7ded6555ac270a279f0873';

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
