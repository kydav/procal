// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodsSearchData _$FoodsSearchDataFromJson(Map<String, dynamic> json) =>
    FoodsSearchData(
      maxResults: json['max_results'] as String,
      totalResults: json['total_results'] as String,
      pageNumber: json['page_number'] as String,
      results: FoodList.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodsSearchDataToJson(FoodsSearchData instance) =>
    <String, dynamic>{
      'max_results': instance.maxResults,
      'total_results': instance.totalResults,
      'page_number': instance.pageNumber,
      'results': instance.results.toJson(),
    };

FoodList _$FoodListFromJson(Map<String, dynamic> json) => FoodList(
  foods: (json['food'] as List<dynamic>)
      .map((e) => Food.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FoodListToJson(FoodList instance) => <String, dynamic>{
  'food': instance.foods.map((e) => e.toJson()).toList(),
};
