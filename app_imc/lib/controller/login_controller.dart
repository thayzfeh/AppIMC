import 'package:app_imc/model/user.dart';
import 'package:app_imc/repositories/user_repository.dart';
import 'package:app_imc/services/prefs_service.dart';

class LoginController {
  static bool isValid(User user) {
    if (UserRepository.exists(user)) {
      PrefsService.save(user);
    }
    return UserRepository.exists(user);
  }

  static bool trySign(User user) {
    bool sucess = UserRepository.save(user);
    if (sucess) {
      PrefsService.save(user);
    }
    return sucess;
  }
}
