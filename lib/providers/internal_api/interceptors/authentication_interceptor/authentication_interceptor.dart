import 'package:app/providers/user_session/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationInterceptor implements Interceptor {
  static const _authenticationTokenKey = 'authentication-token';

  final BuildContext context;

  AuthenticationInterceptor(this.context);

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authenticationToken = getAuthenticationToken();
    if (authenticationToken != null) {
      options.headers[_authenticationTokenKey] = authenticationToken;
    }
    handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final authenticationToken = response.headers[_authenticationTokenKey];
    if (authenticationToken != null && authenticationToken.isNotEmpty) {
      await setAuthenticationToken(authenticationToken[0]);
    }
    handler.next(response);
  }

  Future setAuthenticationToken(String authenticationToken) async {
    await context
        .read<UserSessionProvider>()
        .setUserSession(authenticationToken: authenticationToken);
  }

  String? getAuthenticationToken() {
    return context.read<UserSessionProvider>().userSession.authenticationToken;
  }
}
