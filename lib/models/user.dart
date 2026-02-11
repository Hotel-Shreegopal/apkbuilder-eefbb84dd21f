class User {
  final int id;
  final String email;
  final String password;
  final String? id;

  User({
    this.id,
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map, {String? id}) {
    return User(
      id: id ?? map['id'] as String?,
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  User copyWith({
    String? id,
    int? id,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'User(id: ${id}, email: ${email}, password: ${password})';
  }
}
