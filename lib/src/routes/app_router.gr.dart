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
import 'package:flutter/material.dart' as _i4;

import '../features/authentication/views/login_page.dart' as _i2;
import '../features/authentication/views/select_user_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    UserType.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SelectUserPage());
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
          _i1.RouteConfig(LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
              children: [
                _i1.RouteConfig(UserType.name,
                    path: 'user-type', parent: LoginRoute.name)
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
/// [_i2.LoginPage]
class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i4.Key? key, List<_i1.PageRouteInfo>? children})
      : super(LoginRoute.name,
            path: 'login',
            args: LoginRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SelectUserPage]
class UserType extends _i1.PageRouteInfo<void> {
  const UserType() : super(UserType.name, path: 'user-type');

  static const String name = 'UserType';
}
