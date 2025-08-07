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
  final String? userId;
  final int proteinGoal;
  final int calorieGoal;
  final int? weightGoal;
  final int currentWeight;
  final String objective;
  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
