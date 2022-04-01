import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';

class OrderApp extends StatelessWidget {
  OrderApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Orders",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "lato",
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
