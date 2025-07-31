import 'package:json_annotation/json_annotation.dart';

part 'procal_user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProcalUser {
  ProcalUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    this.birthDate,
    this.height,
    this.currentWeight,
    this.id,
  });

  factory ProcalUser.fromJson(Map<String, dynamic> json) =>
      _$ProcalUserFromJson(json);
  final String email;
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final double? height;
  final double? currentWeight;
  final bool isActive;
  final String? id;
  Map<String, dynamic> toJson() => _$ProcalUserToJson(this);
}
