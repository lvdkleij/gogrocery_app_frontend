import 'dart:convert';

import 'package:app/providers/internal_api/models/basic_response.dart';
import 'package:app/providers/user_shopping_list/user_shopping_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class ShoppingListService {
  final Dio _dio;
  final BuildContext context;
  late final DioAdapter _dioAdapter;

  final basePath = '/shopping-list';

  ShoppingListService(this._dio, this.context) {
    _dioAdapter = DioAdapter(dio: _dio, matcher: const UrlRequestMatcher());
    initAdapter();
  }

  void initAdapter() {
    _dioAdapter.onGet(
        '$basePath/getShoppingLists',
        (server) => server.reply(200, {
              'type': 'Success',
              'message': '',
              'results': [
                {
                  'id': 1,
                  'name': 'Groceries',
                  'members': [],
                  'background': 'f'
                },
                {'id': 2, 'name': 'Baby', 'members': [], 'background': 'f'},
                {'id': 3, 'name': 'Pet', 'members': [], 'background': 'f'},
                {'id': 4, 'name': 'Tools', 'members': [], 'background': 'f'},
              ],
              'extras': {}
            }));
  }

  Future<BasicResponse> createShoppingList({required String name}) {
    return _dio
        .post('$basePath/createShoppingList',
            data: jsonEncode({'backgroundId': 1, 'listName': name}))
        .then((response) => BasicResponse.deserialize(response.data))
        .then((response) {
      print(response);
      final shoppingListsData = ShoppingListData.fromJson(response.results[0]);
      print(shoppingListsData);
      context
          .read<UserShoppingListProvider>()
          .addShoppingList(shoppingListsData);
      return response;
    }).catchError((_) => BasicResponse.emptyResponse);
  }

  Future<BasicResponse> getShoppingLists() {
    final UserShoppingListProvider userShoppingListProvider =
        context.read<UserShoppingListProvider>();
    return _dio
        .get('$basePath/getShoppingLists')
        .then((response) => BasicResponse.deserialize(response.data))
        .then((response) {
      response.results.forEach(((list) => userShoppingListProvider
          .addShoppingList(ShoppingListData.fromJson(list))));
      return response;
    }).catchError((_) {
      print(_);
      return BasicResponse.emptyResponse;
    });
  }
}
