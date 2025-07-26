import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:procal/models/generated_goals.dart';
import 'package:procal/models/generated_meal_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_service.g.dart';

@riverpod
class AiService extends _$AiService {
  @override
  void build() {}
  final GenerativeModel model = FirebaseAI.googleAI().generativeModel(
    model: 'gemini-2.5-flash',
  );

  Future<GenerateContentResponse> _getResponse(
    Iterable<Content> prompt,
    Schema? jsonSchema,
  ) async {
    final response = await model.generateContent(
      prompt,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: jsonSchema,
      ),
    );
    return response;
  }

  Future<GeneratedGoals> generateProteinCalorieGoals(
    int weight,
    String height,
  ) async {
    final jsonSchema = Schema.object(
      properties: {
        'goals': Schema.object(
          properties: {
            'gainMuscleProtein': Schema.integer(),
            'gainMuscleProteinReasoning': Schema.string(),
            'loseWeightProtein': Schema.integer(),
            'loseWeightProteinReasoning': Schema.string(),
            'gainMuscleCalories': Schema.integer(),
            'gainMuscleCaloriesReasoning': Schema.string(),
            'loseWeightCalories': Schema.integer(),
            'loseWeightCaloriesReasoning': Schema.string(),
          },
        ),
      },
    );
    final response = await _getResponse([
      Content.text(
        '''
          Generate two different protein goals and calorie goals
          that are optimal protein in grams and calories for a person 
          who weighs $weight lb and is $height that is looking to 
          build muscle and separately looking to lose fat with reasoning for each?''',
      ),
    ], jsonSchema);
    final goalsJson = json.decode(response.text!);
    return GeneratedGoals.fromJson(goalsJson['goals']);
  }

  Future<GeneratedMealResponse> generateResponseToMeal({
    required int mealProtein,
    required int mealCalories,
    required int goalProtein,
    required int goalCalories,
  }) async {
    final jsonSchema = Schema.object(
      properties: {
        'mealResponse': Schema.object(
          properties: {
            'mealAssessment': Schema.string(),
            'mealAssessmentReasoning': Schema.string(),
            'fitIntoDailyGoals': Schema.object(
              properties: {
                'proteinGoals': Schema.string(),
                'calorieGoals': Schema.string(),
              },
            ),
          },
        ),
      },
    );

    final response = await _getResponse([
      Content.text('''
        Generate a response to the meal that contains $mealCalories calories 
        and $mealProtein grams of protein for a person who is attempting to 
        eat $goalCalories calories and $goalProtein grams of protein and attempting to 
        eat clean and lose weight. The response should include the 
        reasoning for the meal and how it fits into the daily goals.'''),
    ], jsonSchema);
    final mealResponseJson = json.decode(response.text!);
    final mealResponse = GeneratedMealResponse.fromJson(
      mealResponseJson['mealResponse'],
    );
    return mealResponse;
  }
}
