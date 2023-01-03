import 'dart:io';

import 'package:app/providers/internal_api/interceptors/authentication_interceptor/authentication_interceptor.dart';
import 'package:app/providers/internal_api/services/shoppin_list_service/shopping_list_service.dart';
import 'package:app/providers/internal_api/services/user_service/user_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InternalApiClient {
  final _dio = Dio(BaseOptions(
    baseUrl: 'https://localhost/api/v1',
    responseType: ResponseType.plain,
  ));

  late final UserService userService;
  late final ShoppingListService shoppingListService;
  final BuildContext context;

  InternalApiClient(this.context) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(AuthenticationInterceptor(context));

    userService = UserService(_dio);
    shoppingListService = ShoppingListService(_dio, context);
  }
}
