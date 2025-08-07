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
  final GenerativeModel _model = FirebaseAI.googleAI().generativeModel(
    model: 'gemini-2.5-flash',
  );

  Future<GenerateContentResponse> _getResponse(
    Iterable<Content> prompt,
    Schema? jsonSchema,
  ) async {
    // TODO: Look into docs and see if more is supposed to be done before calling
    // if not, then implement try/retry logic for handling errors
    final response = await _model.generateContent(
      prompt,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: jsonSchema,
      ),
    );
    return response;
  }

  Future<GeneratedGoals> generateProteinCalorieGoals(
    String weight,
    String height,
    String age,
    String gender,
    String objective,
  ) async {
    final jsonSchema = Schema.object(
      properties: {
        'goals': Schema.object(
          properties: {
            'protein': Schema.integer(),
            'proteinReasoning': Schema.string(),
            'caloriesSedentary': Schema.integer(),
            'caloriesLightlyActive': Schema.integer(),
            'caloriesModeratelyActive': Schema.integer(),
            'caloriesVeryActive': Schema.integer(),
            'caloriesReasoning': Schema.string(),
          },
        ),
      },
    );
    final response = await _getResponse([
      Content.text('''
          For a person who is $weight, $gender, $height tall, and $age years old,
          that is looking to $objective, generate an optimal protein goal in grams and reasoning for it.  
          Also generate optimal calories for sedentary, lightly active, moderately active, and very active lifestyles,
          with reasoning for the calorie goals.
          '''),
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
