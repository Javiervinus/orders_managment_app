import 'package:auto_route/auto_route.dart';
import 'package:meseros_app/src/features/authentication/views/login_page.dart';
import 'package:meseros_app/src/features/authentication/views/select_user_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(path: 'login', page: LoginPage, initial: true, children: [
      AutoRoute(path: 'user-type', page: SelectUserPage, name: 'UserType'),
    ]),
  ])
])
class $AppRouter {}
