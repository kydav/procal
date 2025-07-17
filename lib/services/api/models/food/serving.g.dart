// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serving.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servings _$ServingsFromJson(Map<String, dynamic> json) => Servings(
  serving: (json['serving'] as List<dynamic>)
      .map((e) => Serving.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServingsToJson(Servings instance) => <String, dynamic>{
  'serving': instance.serving.map((e) => e.toJson()).toList(),
};

Serving _$ServingFromJson(Map<String, dynamic> json) => Serving(
  servingId: json['serving_id'] as String,
  servingDescription: json['serving_description'] as String,
  metricServingAmount: json['metric_serving_amount'] as String,
  metricServingUnit: json['metric_serving_unit'] as String,
  numberOfUnits: json['number_of_units'] as String,
  measurementDescription: json['measurement_description'] as String,
  calories: json['calories'] as String?,
  protein: json['protein'] as String?,
);

Map<String, dynamic> _$ServingToJson(Serving instance) => <String, dynamic>{
  'serving_id': instance.servingId,
  'serving_description': instance.servingDescription,
  'metric_serving_amount': instance.metricServingAmount,
  'metric_serving_unit': instance.metricServingUnit,
  'number_of_units': instance.numberOfUnits,
  'measurement_description': instance.measurementDescription,
  'calories': instance.calories,
  'protein': instance.protein,
};
