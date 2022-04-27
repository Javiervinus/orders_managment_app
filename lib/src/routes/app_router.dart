import 'package:auto_route/auto_route.dart';
import 'package:meseros_app/src/features/authentication/views/login_page.dart';
import 'package:meseros_app/src/features/authentication/views/select_user_page.dart';
import 'package:meseros_app/src/routes/guards/auth_guard.dart';
import 'package:meseros_app/src/screens/orders_page.dart';
import 'package:meseros_app/src/features/tableManagment/views/table_page.dart';
import 'package:meseros_app/src/screens/test_page.dart';
import 'package:meseros_app/src/tab_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
        path: 'login',
        name: 'LoginRouter',
        page: EmptyRouterPage,
        initial: true,
        children: [
          AutoRoute(path: '', page: LoginPage, guards: [AuthGuard]),
          AutoRoute(path: 'user-type', page: SelectUserPage, name: 'UserType'),
        ]),
    AutoRoute(page: TabPage, name: 'TabsAppRouter', path: 'app', children: [
      AutoRoute(
          path: 'orders',
          name: 'OrdersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: OrdersPage),
            AutoRoute(path: 'test', page: TestPage)
          ]),
      AutoRoute(
          path: 'tables',
          name: 'TablesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: TablePage),
            AutoRoute(path: 'test', page: TestPage)
          ])
    ]),
  ]),
])
class $AppRouter {}
