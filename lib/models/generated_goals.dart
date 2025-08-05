class GeneratedGoals {
  const GeneratedGoals({
    required this.protein,
    required this.proteinReasoning,
    required this.caloriesSedentary,
    required this.caloriesLightlyActive,
    required this.caloriesModeratelyActive,
    required this.caloriesVeryActive,
    required this.caloriesReasoning,
  });
  factory GeneratedGoals.fromJson(Map<String, dynamic> json) => GeneratedGoals(
    protein: json['protein'],
    proteinReasoning: json['proteinReasoning'],
    caloriesSedentary: json['caloriesSedentary'],
    caloriesLightlyActive: json['caloriesLightlyActive'],
    caloriesModeratelyActive: json['caloriesModeratelyActive'],
    caloriesVeryActive: json['caloriesVeryActive'],
    caloriesReasoning: json['caloriesReasoning'],
  );

  final int protein;
  final String proteinReasoning;
  final int caloriesSedentary;
  final int caloriesLightlyActive;
  final int caloriesModeratelyActive;
  final int caloriesVeryActive;
  final String caloriesReasoning;

  Map<String, dynamic> toJson() => {
    'protein': protein,
    'proteinReasoning': proteinReasoning,
    'caloriesSedentary': caloriesSedentary,
    'caloriesLightlyActive': caloriesLightlyActive,
    'caloriesModeratelyActive': caloriesModeratelyActive,
    'caloriesVeryActive': caloriesVeryActive,
    'caloriesReasoning': caloriesReasoning,
  };
}
