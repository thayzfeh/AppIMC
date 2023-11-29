class User {
  final String email;
  final String pass;
  User({required this.email, required this.pass});
  @override
  String toString() {
    return 'E-mail: $email | Password: $pass';
  }
}
