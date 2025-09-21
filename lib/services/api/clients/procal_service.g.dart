// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procal_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProcalService)
const procalServiceProvider = ProcalServiceProvider._();

final class ProcalServiceProvider
    extends $NotifierProvider<ProcalService, ProcalClient> {
  const ProcalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'procalServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$procalServiceHash();

  @$internal
  @override
  ProcalService create() => ProcalService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProcalClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProcalClient>(value),
    );
  }
}

String _$procalServiceHash() => r'519abdbda80b3af0d0af7c70b7a2e0955ab4cd8e';

abstract class _$ProcalService extends $Notifier<ProcalClient> {
  ProcalClient build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProcalClient, ProcalClient>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProcalClient, ProcalClient>,
              ProcalClient,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
