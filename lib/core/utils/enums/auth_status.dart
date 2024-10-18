enum AuthStatus {
  notLoggedIn("NotLoggedIn"),
  loggedIn("LoggedIn"),
  error("Error");

  final String name;

  const AuthStatus(this.name);
}
