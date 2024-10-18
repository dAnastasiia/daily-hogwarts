class AuthUser {
  final String uid;

  AuthUser({
    required this.uid,
  });
}

class AuthUserCredential {
  final AuthUser user;

  AuthUserCredential({required this.user});
}
