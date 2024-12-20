import 'package:xozmag_admin/features/auth/domain/entities/user_entity.dart';
import 'package:xozmag_admin/features/auth/domain/entities/user_params.dart';

abstract class AuthApi {
  Future<User> loginUser(UserParams params);
}