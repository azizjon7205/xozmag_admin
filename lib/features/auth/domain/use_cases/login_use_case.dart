
import '../entities/user_params.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  /// this method is called by controller of the page,
  /// just return only required data for the ui
  /// in that case, the ui needs only result whether the login is success or not
  Future<bool> call(String login, String password) async {
    return _repository.login(UserParams(login: login, password: password));
  }
}