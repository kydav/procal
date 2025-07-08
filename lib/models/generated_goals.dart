class GeneratedGoals {
  const GeneratedGoals({
    required this.gainMuscleProtein,
    required this.gainMuscleProteinReasoning,
    required this.loseWeightProtein,
    required this.loseWeightProteinReasoning,
    required this.gainMuscleCalories,
    required this.gainMuscleCaloriesReasoning,
    required this.loseWeightCalories,
    required this.loseWeightCaloriesReasoning,
  });
  factory GeneratedGoals.fromJson(Map<String, dynamic> json) => GeneratedGoals(
    gainMuscleProtein: json['gainMuscleProtein'],
    gainMuscleProteinReasoning: json['gainMuscleProteinReasoning'],
    loseWeightProtein: json['loseWeightProtein'],
    loseWeightProteinReasoning: json['loseWeightProteinReasoning'],
    gainMuscleCalories: json['gainMuscleCalories'],
    gainMuscleCaloriesReasoning: json['gainMuscleCaloriesReasoning'],
    loseWeightCalories: json['loseWeightCalories'],
    loseWeightCaloriesReasoning: json['loseWeightCaloriesReasoning'],
  );

  final int gainMuscleProtein;
  final String gainMuscleProteinReasoning;
  final int loseWeightProtein;
  final String loseWeightProteinReasoning;
  final int gainMuscleCalories;
  final String gainMuscleCaloriesReasoning;
  final int loseWeightCalories;
  final String loseWeightCaloriesReasoning;

  Map<String, dynamic> toJson() => {
    'gainMuscleProtein': gainMuscleProtein,
    'gainMuscleProteinReasoning': gainMuscleProteinReasoning,
    'loseWeightProtein': loseWeightProtein,
    'loseWeightProteinReasoning': loseWeightProteinReasoning,
    'gainMuscleCalories': gainMuscleCalories,
    'gainMuscleCaloriesReasoning': gainMuscleCaloriesReasoning,
    'loseWeightCalories': loseWeightCalories,
    'loseWeightCaloriesReasoning': loseWeightCaloriesReasoning,
  };
}
