class User {
  const User({required this.id, required this.email, required this.name});

  final String id;
  final String email;
  final String name;

  User copyWith({String? id, String? email, String? name}) => User(
      id: id ?? this.id, email: email ?? this.email, name: name ?? this.name);
}
