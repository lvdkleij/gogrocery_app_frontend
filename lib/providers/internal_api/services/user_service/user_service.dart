import 'dart:convert';

import 'package:app/providers/internal_api/models/basic_response.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class UserService {
  final Dio _dio;
  static const basePath = '/user';
  late final DioAdapter _dioAdapter;

  UserService(this._dio) {
    _dioAdapter = DioAdapter(dio: _dio, matcher: const UrlRequestMatcher());
    initAdapter();
  }

  void initAdapter() {
    _dioAdapter.onPost(
        '$basePath/sendAuthenticationCode',
        (server) => server.reply(200, {
              'type': '',
              'message': '',
              'results': [],
              'extras': {'validUntil': '1'}
            }));

    _dioAdapter.onPost(
        '$basePath/verifyAuthenticationCode',
        (server) => server.reply(200, {
              'type': '',
              'message': '',
              'results': [],
              'extras': {'validUntil': '1'}
            }, headers: {
              'authentication-token': ['AtOkEn']
            }));

    _dioAdapter.onPost(
        '$basePath/updateUser',
        (server) => server.reply(200, {
              'type': '',
              'message': '',
              'results': [],
              'extras': {'validUntil': '1'}
            }, headers: {
              'authentication-token': ['ANeWToKen']
            }));
  }

  Future<BasicResponse> loginWithEmail({required String email}) {
    return _dio
        .post('$basePath/sendAuthenticationCode',
            data: jsonEncode({'email': email}))
        .then((response) => BasicResponse.deserialize(response.data))
        .catchError((_) => BasicResponse.emptyResponse);
  }

  Future<BasicResponse> verifyAuthenticationCode(
      {required String email, required int verificationCode}) {
    return _dio
        .post('$basePath/verifyAuthenticationCode',
            data: jsonEncode(
                {'email': email, 'verificationCode': verificationCode}))
        .then((response) => BasicResponse.deserialize(response.data))
        .catchError((_) => BasicResponse.emptyResponse);
  }

  Future<BasicResponse> updateUser({required String name}) {
    return _dio
        .post('$basePath/updateUser', data: jsonEncode({'name': name}))
        .then((response) => BasicResponse.deserialize(response.data))
        .catchError((_) => BasicResponse.emptyResponse);
  }
}
