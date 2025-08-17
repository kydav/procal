// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) => JournalEntry(
  id: json['Id'] as String,
  userId: json['UserId'] as String,
  foodId: json['FoodId'] as String,
  foodAmount: json['FoodAmount'] as String,
  date: DateTime.parse(json['Date'] as String),
  protein: (json['Protein'] as num).toInt(),
  calories: (json['Calories'] as num).toInt(),
);

Map<String, dynamic> _$JournalEntryToJson(JournalEntry instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'FoodId': instance.foodId,
      'FoodAmount': instance.foodAmount,
      'Date': instance.date.toIso8601String(),
      'Protein': instance.protein,
      'Calories': instance.calories,
    };
