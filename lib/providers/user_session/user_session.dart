import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSessionProvider extends ChangeNotifier {
  static var _wasInitialized = false;
  static const _storage = FlutterSecureStorage();
  static const _storageKey = 'user-session';
  static final _userSession = UserSession();

  static Future init() async {
    if (!_wasInitialized) {
      final userSessionJson = await _storage.read(key: _storageKey);
      final userSession = userSessionJson != null
          ? UserSession.deserialize(userSessionJson)
          : null;

      if (userSession != null) {
        _userSession.copy(userSession);
      }

      _wasInitialized = true;
    }
  }

  Future setUserSession(
      {String? email, String? name, String? authenticationToken}) async {
    _userSession.update(
        email: email, name: name, authenticationToken: authenticationToken);

    await _storage.write(
      key: _storageKey,
      value: UserSession.serialize(_userSession),
    );
    notifyListeners();
  }

  UserSession get userSession => _userSession;
}

class UserSession {
  var _email;
  var _authenticationToken;
  var _name;
  var _language;
  var _currency;
  var _measurement;

  UserSession({
    String? email,
    String? name,
    String? authenticationToken,
    String? language,
    String? currency,
    String? measurement,
  }) {
    update(
        email: email,
        name: name,
        authenticationToken: authenticationToken,
        language: language,
        currency: currency,
        measurement: measurement);
    _measurement = measurement ?? _measurement;
  }

  void update({
    String? email,
    String? name,
    String? authenticationToken,
    String? language,
    String? currency,
    String? measurement,
  }) {
    _email = email ?? _email;
    _name = name ?? _name;
    _authenticationToken = authenticationToken ?? _authenticationToken;
    _language = language ?? _language;
    _currency = currency ?? _currency;
    _measurement = measurement ?? _measurement;
  }

  void copy(UserSession userSession) {
    _authenticationToken = userSession._authenticationToken;
    _email = userSession._email;
    _name = userSession._name;
    _language = userSession._language;
    _currency = userSession._currency;
    _measurement = userSession._measurement;
  }

  static _fromJson(Map<String, dynamic> jsonData) => UserSession(
      email: jsonData['email'],
      authenticationToken: jsonData['authenticationToken'],
      name: jsonData['name']);

  static Map<String, dynamic> _toMap(UserSession userSession) =>
      <String, dynamic>{
        'email': userSession._email,
        'authenticationToken': userSession._authenticationToken,
        'name': userSession._name,
      };

  static String serialize(UserSession userSession) =>
      jsonEncode(UserSession._toMap(userSession));

  static UserSession deserialize(String json) =>
      UserSession._fromJson(jsonDecode(json));

  String? get email => _email;
  String? get name => _name;
  String? get authenticationToken => _authenticationToken;

  @override
  String toString() =>
      '{ email: $_email, name: $_name, authenticationToken: $_authenticationToken }';
}
