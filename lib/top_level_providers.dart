import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:procal/services/device_services/local_storage_service.dart';

final proteinConsumedProvider = StateProvider<int?>((_) => null);
final proteinGoalProvider = StateProvider<int?>((_) => null);

final caloriesConsumedProvider = StateProvider<int?>((_) => null);
final caloriesGoalProvider = StateProvider<int?>((_) => null);

final localStorageServiceProvider = Provider<LocalStorageService>(
  (_) => LocalStorageService(),
);

final currentUserProvider = StreamProvider<User?>((ref) {
  final auth = FirebaseAuth.instance;

  return auth.authStateChanges();
});
