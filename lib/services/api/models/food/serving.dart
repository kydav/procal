import 'package:json_annotation/json_annotation.dart';

part 'serving.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Servings {
  Servings({required this.serving});
  factory Servings.fromJson(Map<String, dynamic> json) =>
      _$ServingsFromJson(json);
  @JsonKey(name: 'serving')
  List<Serving> serving;

  Map<String, dynamic> toJson() => _$ServingsToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Serving {
  Serving({
    required this.servingId,
    required this.servingDescription,
    required this.metricServingAmount,
    required this.metricServingUnit,
    required this.numberOfUnits,
    required this.measurementDescription,
    this.calories,
    this.protein,
  });
  factory Serving.fromJson(Map<String, dynamic> json) =>
      _$ServingFromJson(json);
  @JsonKey(name: 'serving_id')
  String servingId;
  @JsonKey(name: 'serving_description')
  String servingDescription;
  @JsonKey(name: 'metric_serving_amount')
  String metricServingAmount;
  @JsonKey(name: 'metric_serving_unit')
  String metricServingUnit;
  @JsonKey(name: 'number_of_units')
  String numberOfUnits;
  @JsonKey(name: 'measurement_description')
  String measurementDescription;
  @JsonKey(name: 'calories')
  String? calories;
  @JsonKey(name: 'protein')
  String? protein;
  @JsonKey(name: 'fat')
  String? fat;

  Map<String, dynamic> toJson() => _$ServingToJson(this);
}
