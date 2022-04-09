import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meseros_app/src/core/colors.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';
import 'package:meseros_app/src/routes/guards/auth_guard.dart';

class OrderApp extends StatelessWidget {
  OrderApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(p
    //     SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Orders",
        theme: ThemeData(
          primarySwatch: primaryBlack,
          fontFamily: "lato",
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
