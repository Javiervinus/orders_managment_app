import 'package:meseros_app/src/core/http/dio.dart';
import 'package:meseros_app/src/features/authentication/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(String email, String password);
  bool logOut();
  UserModel? user;
}

class AuthRepository implements IAuthRepository {
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      var data = {"email": email.trim(), "password": password.trim()};
      final result = await DioClient().dio.post("auth/login", data: data);
      if (result.statusCode == 201) {
        user = UserModel.fromJson(result.data);
        return user!;
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
