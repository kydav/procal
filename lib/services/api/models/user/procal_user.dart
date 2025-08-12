import 'package:json_annotation/json_annotation.dart';

part 'procal_user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProcalUser {
  ProcalUser({
    required this.email,
    required this.firebaseUid,
    required this.isActive,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.height,
    this.currentWeight,
    this.id,
    this.age,
    this.gender,
    this.measurementPreference,
  });
  factory ProcalUser.fromJson(Map<String, dynamic> json) =>
      _$ProcalUserFromJson(json);
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'FirebaseUid')
  final String firebaseUid;
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @JsonKey(name: 'FirstName')
  final String? firstName;
  @JsonKey(name: 'LastName')
  final String? lastName;
  @JsonKey(name: 'BirthDate')
  final DateTime? birthDate;
  @JsonKey(name: 'Height')
  final double? height;
  @JsonKey(name: 'CurrentWeight')
  final double? currentWeight;
  @JsonKey(name: 'ID')
  final String? id;
  @JsonKey(name: 'Age')
  final int? age;
  @JsonKey(name: 'Gender')
  final String? gender;
  @JsonKey(name: 'MeasurementPreference')
  final String? measurementPreference;
  Map<String, dynamic> toJson() => _$ProcalUserToJson(this);
}
