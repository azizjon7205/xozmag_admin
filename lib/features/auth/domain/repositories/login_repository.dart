
import '../entities/user_params.dart';

abstract class LoginRepository {
  Future<bool> login(UserParams params);
}