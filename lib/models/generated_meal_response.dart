class GeneratedMealResponse {
  const GeneratedMealResponse({
    required this.mealAssessment,
    required this.mealAssessmentReasoning,
    required this.fitIntoDailyGoals,
  });
  factory GeneratedMealResponse.fromJson(Map<String, dynamic> json) =>
      GeneratedMealResponse(
        mealAssessment: json['mealAssessment'],
        mealAssessmentReasoning: json['mealAssessmentReasoning'],
        fitIntoDailyGoals: FitIntoDailyGoals.fromJson(
          json['fitIntoDailyGoals'],
        ),
      );

  final String mealAssessment;
  final String mealAssessmentReasoning;
  final FitIntoDailyGoals fitIntoDailyGoals;

  Map<String, dynamic> toJson() => {
    'mealAssessment': mealAssessment,
    'mealAssessmentReasoning': mealAssessmentReasoning,
    'fitIntoDailyGoals': fitIntoDailyGoals.toJson(),
  };
}

class FitIntoDailyGoals {
  const FitIntoDailyGoals({
    required this.proteinGoals,
    required this.calorieGoals,
  });

  factory FitIntoDailyGoals.fromJson(Map<String, dynamic> json) =>
      FitIntoDailyGoals(
        proteinGoals: json['proteinGoals'],
        calorieGoals: json['calorieGoals'],
      );

  final String proteinGoals;
  final String calorieGoals;

  Map<String, dynamic> toJson() => {
    'proteinGoals': proteinGoals,
    'calorieGoals': calorieGoals,
  };
}
