import 'package:dio/dio.dart';
import 'package:meseros_app/src/core/env/enviroment_config.dart';
import 'package:meseros_app/src/features/authentication/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(String email, String password);
  bool logOut();
  UserModel? user;
}

class AuthRepository implements IAuthRepository {
  final _dioClient = Dio();

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      var data = {"email": email.trim(), "password": password.trim()};
      final result = await _dioClient
          .post(EnvironmentConfig.apiUrl + "auth/login", data: data);
      if (result.statusCode == 201) {
        user = UserModel.fromJson(result.data);
        return UserModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      print(_.toString());
      throw Exception();
    }
  }

  @override
  bool logOut() {
    user = null;
    return true;
  }

  @override
  UserModel? user;
}
