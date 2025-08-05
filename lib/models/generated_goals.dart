class GeneratedGoals {
  const GeneratedGoals({
    required this.protein,
    required this.proteinReasoning,
    required this.calories,
    required this.caloriesReasoning,
  });
  factory GeneratedGoals.fromJson(Map<String, dynamic> json) => GeneratedGoals(
    protein: json['protein'],
    proteinReasoning: json['proteinReasoning'],
    calories: json['calories'],
    caloriesReasoning: json['caloriesReasoning'],
  );

  final int protein;
  final String proteinReasoning;
  final int calories;
  final String caloriesReasoning;

  Map<String, dynamic> toJson() => {
    'protein': protein,
    'proteinReasoning': proteinReasoning,
    'calories': calories,
    'caloriesReasoning': caloriesReasoning,
  };
}
