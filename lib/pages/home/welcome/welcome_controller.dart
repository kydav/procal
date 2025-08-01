import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_controller.g.dart';

@riverpod
class WelcomeController extends _$WelcomeController {
  @override
  WelcomeControllerState build() => WelcomeControllerState(
    firstName: '',
    lastName: '',
    age: '',
    primaryGoal: null,
  );

  void setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setAge(String age) {
    state = state.copyWith(age: age);
  }

  void setPrimaryGoal(String primaryGoal) {
    state = state.copyWith(primaryGoal: primaryGoal);
  }
}

class WelcomeControllerState {
  WelcomeControllerState({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.primaryGoal,
  });
  final String firstName;
  final String lastName;
  final String age;
  final String? primaryGoal;
  WelcomeControllerState copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? primaryGoal,
  }) => WelcomeControllerState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    age: age ?? this.age,
    primaryGoal: primaryGoal ?? this.primaryGoal,
  );
}
