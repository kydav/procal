import 'package:json_annotation/json_annotation.dart';

part 'journal_entry.g.dart';

@JsonSerializable()
class JournalEntry {
  JournalEntry({
    required this.id,
    required this.userId,
    required this.foodId,
    required this.foodAmount,
    required this.date,
    required this.protein,
    required this.calories,
  });
  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
  @JsonKey(name: 'Id')
  final String id;
  @JsonKey(name: 'UserId')
  final String userId;
  @JsonKey(name: 'FoodId')
  final String foodId;
  @JsonKey(name: 'FoodAmount')
  final String foodAmount;
  @JsonKey(name: 'Date')
  final DateTime date;
  @JsonKey(name: 'Protein')
  final int protein;
  @JsonKey(name: 'Calories')
  final int calories;

  Map<String, dynamic> toJson() => _$JournalEntryToJson(this);
}
