// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procal_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcalUser _$ProcalUserFromJson(Map<String, dynamic> json) => ProcalUser(
  email: json['email'] as String,
  firebaseUid: json['firebase_uid'] as String,
  isActive: json['is_active'] as bool,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  birthDate: json['birth_date'] == null
      ? null
      : DateTime.parse(json['birth_date'] as String),
  height: (json['height'] as num?)?.toDouble(),
  currentWeight: (json['current_weight'] as num?)?.toDouble(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProcalUserToJson(ProcalUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firebase_uid': instance.firebaseUid,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate?.toIso8601String(),
      'height': instance.height,
      'current_weight': instance.currentWeight,
      'is_active': instance.isActive,
      'id': instance.id,
    };
