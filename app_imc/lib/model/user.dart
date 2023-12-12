class User {
  final String user;
  final String pass;
  User({required this.user, required this.pass});
  @override
  String toString() {
    return 'User: $user | Password: $pass';
  }
}
