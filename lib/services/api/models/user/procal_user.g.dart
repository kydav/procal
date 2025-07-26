// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procal_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcalUser _$ProcalUserFromJson(Map<String, dynamic> json) => ProcalUser(
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  isActive: json['is_active'] as bool,
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProcalUserToJson(ProcalUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_active': instance.isActive,
      'id': instance.id,
    };
