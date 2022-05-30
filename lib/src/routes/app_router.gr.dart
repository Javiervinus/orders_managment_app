// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

import '../features/authentication/views/login_page.dart' as _i3;
import '../features/authentication/views/select_user_page.dart' as _i4;
import '../features/table_managment/views/table_page.dart' as _i7;
import '../screens/orders_page.dart' as _i5;
import '../screens/test_page.dart' as _i6;
import '../tab_page.dart' as _i2;
import 'guards/auth_guard.dart' as _i9;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    LoginRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    TabsAppRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.TabPage());
    },
    LoginRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    UserType.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SelectUserPage());
    },
    OrdersRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    TablesRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.OrdersPage(key: args.key));
    },
    TestRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.TestPage());
    },
    TableRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.TablePage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterRoute.name, path: '/', children: [
          _i1.RouteConfig('#redirect',
              path: '',
              parent: EmptyRouterRoute.name,
              redirectTo: 'login',
              fullMatch: true),
          _i1.RouteConfig(LoginRouter.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
              children: [
                _i1.RouteConfig(LoginRoute.name,
                    path: '', parent: LoginRouter.name, guards: [authGuard]),
                _i1.RouteConfig(UserType.name,
                    path: 'user-type', parent: LoginRouter.name)
              ]),
          _i1.RouteConfig(TabsAppRouter.name,
              path: 'app',
              parent: EmptyRouterRoute.name,
              children: [
                _i1.RouteConfig(OrdersRouter.name,
                    path: 'orders',
                    parent: TabsAppRouter.name,
                    children: [
                      _i1.RouteConfig(OrdersRoute.name,
                          path: '', parent: OrdersRouter.name),
                      _i1.RouteConfig(TestRoute.name,
                          path: 'test', parent: OrdersRouter.name)
                    ]),
                _i1.RouteConfig(TablesRouter.name,
                    path: 'tables',
                    parent: TabsAppRouter.name,
                    children: [
                      _i1.RouteConfig(TableRoute.name,
                          path: '', parent: TablesRouter.name),
                      _i1.RouteConfig(TestRoute.name,
                          path: 'test', parent: TablesRouter.name)
                    ])
              ])
        ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i1.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i1.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name, path: '/', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class LoginRouter extends _i1.PageRouteInfo<void> {
  const LoginRouter({List<_i1.PageRouteInfo>? children})
      : super(LoginRouter.name, path: 'login', initialChildren: children);

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i2.TabPage]
class TabsAppRouter extends _i1.PageRouteInfo<void> {
  const TabsAppRouter({List<_i1.PageRouteInfo>? children})
      : super(TabsAppRouter.name, path: 'app', initialChildren: children);

  static const String name = 'TabsAppRouter';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i1.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SelectUserPage]
class UserType extends _i1.PageRouteInfo<void> {
  const UserType() : super(UserType.name, path: 'user-type');

  static const String name = 'UserType';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class OrdersRouter extends _i1.PageRouteInfo<void> {
  const OrdersRouter({List<_i1.PageRouteInfo>? children})
      : super(OrdersRouter.name, path: 'orders', initialChildren: children);

  static const String name = 'OrdersRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class TablesRouter extends _i1.PageRouteInfo<void> {
  const TablesRouter({List<_i1.PageRouteInfo>? children})
      : super(TablesRouter.name, path: 'tables', initialChildren: children);

  static const String name = 'TablesRouter';
}

/// generated route for
/// [_i5.OrdersPage]
class OrdersRoute extends _i1.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({_i8.Key? key})
      : super(OrdersRoute.name, path: '', args: OrdersRouteArgs(key: key));

  static const String name = 'OrdersRoute';
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.TestPage]
class TestRoute extends _i1.PageRouteInfo<void> {
  const TestRoute() : super(TestRoute.name, path: 'test');

  static const String name = 'TestRoute';
}

/// generated route for
/// [_i7.TablePage]
class TableRoute extends _i1.PageRouteInfo<void> {
  const TableRoute() : super(TableRoute.name, path: '');

  static const String name = 'TableRoute';
}
