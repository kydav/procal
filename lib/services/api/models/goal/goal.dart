import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

@JsonSerializable()
class Goal {
  Goal({
    required this.userId,
    required this.proteinGoal,
    required this.calorieGoal,
    required this.currentWeight,
    required this.objective,
    this.weightGoal,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
  @JsonKey(name: 'UserId')
  final String? userId;

  @JsonKey(name: 'ProteinGoal')
  final int proteinGoal;

  @JsonKey(name: 'CalorieGoal')
  final int calorieGoal;

  @JsonKey(name: 'WeightGoal')
  final int? weightGoal;

  @JsonKey(name: 'CurrentWeight')
  final int currentWeight;

  @JsonKey(name: 'Objective')
  final String objective;
  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
