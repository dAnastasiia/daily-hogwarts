class UserModel {
  final String username;
  final String email;
  final String house;

  UserModel({
    required this.username,
    required this.email,
    required this.house,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      house: map['house'] ?? '',
    );
  }
}
