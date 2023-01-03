import 'dart:convert';

import 'package:equatable/equatable.dart';

class BasicResponse<T> extends Equatable {
  final String type;
  final String message;
  final List<T> results;
  final Map<String, dynamic> extras;

  const BasicResponse(
      {required this.type,
      required this.message,
      required this.results,
      required this.extras});

  static _fromJson<T>(Map<String, dynamic> data) => BasicResponse<T>(
      type: data['type'],
      message: data['message'],
      results: data['results'],
      extras: data['extras']);

  static BasicResponse<T> deserialize<T>(String json) =>
      BasicResponse._fromJson(jsonDecode(json));

  static get emptyResponse =>
      const BasicResponse(type: '', message: '', results: [], extras: {});

  bool isEmpty() => this == emptyResponse;

  @override
  List<Object?> get props => [type, message, results, extras];
}
