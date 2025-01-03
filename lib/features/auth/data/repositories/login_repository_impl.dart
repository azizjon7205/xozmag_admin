import '/shared/data/data_sources/local/app_shared_prefs.dart';
import '../../domain/entities/user_params.dart';
import '../../domain/repositories/login_repository.dart';
import '../remote/auth_api.dart';

class LoginRepositoryImpl extends LoginRepository {
  final AuthApi _api;
  final AppSharedPrefs _sharedPrefs;

  LoginRepositoryImpl(this._api, this._sharedPrefs);

  @override
  Future<bool> login(UserParams params) async {
    try {
      final response = await _api.loginUser(params);
      _sharedPrefs.setAuthToken(response.token);
      _sharedPrefs.setRefreshToken(response.refreshToken);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
