import 'dart:convert';

import 'package:flutter/material.dart';

class UserShoppingListProvider extends ChangeNotifier {
  final List<ShoppingListData> _shoppingLists = [];
  int? _activeShoppingListIndex;

  void setActiveShoppingListIndex(int index) {
    _activeShoppingListIndex = index;
    notifyListeners();
  }

  void addShoppingList(ShoppingListData list) {
    _shoppingLists.add(list);
    notifyListeners();
  }

  void addItemToActiveShoppingList(String item) {
    _shoppingLists[_activeShoppingListIndex!].addItem(item);
    notifyListeners();
  }

  List<ShoppingListData> get shoppingLists => _shoppingLists;
  ShoppingListData? get activeShoppingList => _activeShoppingListIndex != null
      ? _shoppingLists[_activeShoppingListIndex!]
      : null;
}

class ShoppingListData {
  ShoppingListData(
      {required this.name, required this.id, required this.background});

  String name;
  String background;
  int id;
  final List<String> _items = [];

  addItem(String value) {
    _items.add(value);
  }

  static fromJson(Map<String, dynamic> jsonData) => ShoppingListData(
      name: jsonData['name'],
      background: jsonData['background'],
      id: jsonData['id']);

  List<String> get items => _items;
}

class ShoppingListMemberData {}
