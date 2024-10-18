class AuthPayload {
  final String email;
  final String? password;
  final String? username;

  AuthPayload({
    required this.email,
    required this.password,
    this.username,
  });
}
