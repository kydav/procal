import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class User {
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final String? id;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
