import 'package:xozmag_admin/features/auth/data/data_sources/remote/auth_api.dart';
import 'package:xozmag_admin/features/auth/domain/entities/user_entity.dart';
import 'package:xozmag_admin/features/auth/domain/entities/user_params.dart';

import '../../../../../shared/models/app_error.dart';
import '/core/network/api_service.dart';

class AuthApiImpl extends AuthApi{

  final ApiService network;

  AuthApiImpl(this.network);


  @override
  Future<User> loginUser(UserParams params) async{
    final result = await network.post<User>(
        '',
        data: params.toJson(),
        tFromJson: User.fromJson);
    if (result.success == true && result.data != null) {
      return result.data!;
    } else {
      throw result.error ?? AppError(message: "Something went wrong");
    }
  }

}