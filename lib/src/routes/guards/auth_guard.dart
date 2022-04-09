import 'package:auto_route/auto_route.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/repositories/auth_repository.dart';

class AuthGuard extends AutoRouteGuard {
  final IAuthRepository _authRepository = AuthRepository();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("user")) {
      print("aquu");
      router.replace(UserType());
    } else {
      resolver.next(true);
    }
  }
}
