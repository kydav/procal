// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procal_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcalUser _$ProcalUserFromJson(Map<String, dynamic> json) => ProcalUser(
  email: json['Email'] as String,
  firebaseUid: json['FirebaseUid'] as String,
  isActive: json['IsActive'] as bool,
  firstName: json['FirstName'] as String?,
  lastName: json['LastName'] as String?,
  birthDate: json['BirthDate'] == null
      ? null
      : DateTime.parse(json['BirthDate'] as String),
  height: (json['Height'] as num?)?.toDouble(),
  currentWeight: (json['CurrentWeight'] as num?)?.toDouble(),
  id: json['ID'] as String?,
  age: (json['Age'] as num?)?.toInt(),
  gender: json['Gender'] as String?,
  measurementPreference: json['MeasurementPreference'] as String?,
);

Map<String, dynamic> _$ProcalUserToJson(ProcalUser instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'FirebaseUid': instance.firebaseUid,
      'IsActive': instance.isActive,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'BirthDate': instance.birthDate?.toIso8601String(),
      'Height': instance.height,
      'CurrentWeight': instance.currentWeight,
      'ID': instance.id,
      'Age': instance.age,
      'Gender': instance.gender,
      'MeasurementPreference': instance.measurementPreference,
    };
