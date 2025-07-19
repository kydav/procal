import 'package:json_annotation/json_annotation.dart';
import 'package:procal/services/api/models/food/food.dart';

part 'foods_search.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FoodsSearchData {
  FoodsSearchData({
    required this.maxResults,
    required this.totalResults,
    required this.pageNumber,
    required this.results,
  });

  factory FoodsSearchData.fromJson(Map<String, dynamic> json) =>
      _$FoodsSearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsSearchDataToJson(this);
  @JsonKey(name: 'max_results')
  String maxResults;
  @JsonKey(name: 'total_results')
  String totalResults;
  @JsonKey(name: 'page_number')
  String pageNumber;
  @JsonKey(name: 'results')
  FoodList results;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FoodList {
  FoodList({required this.foods});
  factory FoodList.fromJson(Map<String, dynamic> json) =>
      _$FoodListFromJson(json);
  @JsonKey(name: 'food')
  List<Food> foods;

  Map<String, dynamic> toJson() => _$FoodListToJson(this);
}
