// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_page_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WelcomePageState)
const welcomePageStateProvider = WelcomePageStateProvider._();

final class WelcomePageStateProvider
    extends $AsyncNotifierProvider<WelcomePageState, WelcomeState> {
  const WelcomePageStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'welcomePageStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$welcomePageStateHash();

  @$internal
  @override
  WelcomePageState create() => WelcomePageState();
}

String _$welcomePageStateHash() => r'76bdf8c5c24be6fb6a040bd7a1ac76ff4a273659';

abstract class _$WelcomePageState extends $AsyncNotifier<WelcomeState> {
  FutureOr<WelcomeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WelcomeState>, WelcomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WelcomeState>, WelcomeState>,
              AsyncValue<WelcomeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
