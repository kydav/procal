// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthStateNotifier)
const authStateProvider = AuthStateNotifierProvider._();

final class AuthStateNotifierProvider
    extends $AsyncNotifierProvider<AuthStateNotifier, CurrentAuthState> {
  const AuthStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateNotifierHash();

  @$internal
  @override
  AuthStateNotifier create() => AuthStateNotifier();
}

String _$authStateNotifierHash() => r'714c86fb45fbd95c1cd0983274a2f36400dcb998';

abstract class _$AuthStateNotifier extends $AsyncNotifier<CurrentAuthState> {
  FutureOr<CurrentAuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<CurrentAuthState>, CurrentAuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CurrentAuthState>, CurrentAuthState>,
              AsyncValue<CurrentAuthState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
