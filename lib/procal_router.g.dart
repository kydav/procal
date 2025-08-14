// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procal_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ProcalRouter)
const procalRouterProvider = ProcalRouterProvider._();

final class ProcalRouterProvider
    extends $NotifierProvider<ProcalRouter, GoRouter> {
  const ProcalRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'procalRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$procalRouterHash();

  @$internal
  @override
  ProcalRouter create() => ProcalRouter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$procalRouterHash() => r'801ae01b46d1ecba36aa7da5d76eb1efa730a9ba';

abstract class _$ProcalRouter extends $Notifier<GoRouter> {
  GoRouter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GoRouter, GoRouter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GoRouter, GoRouter>,
              GoRouter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
