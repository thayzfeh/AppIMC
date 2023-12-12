import 'package:app_imc/model/user.dart';

class UserRepository {
  static List<User> userRepository = [
    User(user: 'adm', pass: '123'),
    User(user: 'rafael', pass: 'Rafael'),
    User(user: 'maria', pass: '00028922'),
    User(user: 'cristian', pass: 'semmundial'),
  ];

  static bool exists(User user) {
    var findUser =
        userRepository.where((u) => u.user == user.user && u.pass == user.pass);
    return findUser.isNotEmpty;
  }

  static bool save(User user) {
    if (userRepository.where((u) => u.user == user.user).isEmpty) {
      userRepository.add(user);
      return true;
    }
    return false;
  }
}
