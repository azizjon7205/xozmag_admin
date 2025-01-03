import '/core/network/api_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/user_params.dart';
import 'auth_api.dart';

class AuthApiImpl extends AuthApi {
  final ApiService network;

  AuthApiImpl(this.network);

  @override
  Future<User> loginUser(UserParams params) {
    return network.post<User>(
      'put api here without base url',
      data: params.toJson(),
      tFromJson: User.fromJson,
    );
  }
}
