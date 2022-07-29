import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //remove the auxiliary header

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    options.headers.addAll({"Authorization": "Bearer $token"});
    return super.onRequest(options, handler);
  }

  // @override
  // FutureOr<dynamic> onError(DioError dioError) {
  //   if (dioError.message.contains("ERROR_001")) {
  //     // this will push a new route and remove all the routes that were present
  //     navigatorKey.currentState
  //         .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
  //   }

  //   return dioError;
  // }

  // @override
  // FutureOr<dynamic> onResponse(Response options) async {
  //   if (options.headers.value("verifyToken") != null) {
  //     //if the header is present, then compare it with the Shared Prefs key
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var verifyToken = prefs.get("VerifyToken");

  //     // if the value is the same as the header, continue with the request
  //     if (options.headers.value("verifyToken") == verifyToken) {
  //       return options;
  //     }
  //   }

  //   return DioError(
  //       request: options.request, message: "User is no longer active");
  // }
}
