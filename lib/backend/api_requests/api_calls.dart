import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CloudQuestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'cloudQuest',
      apiUrl:
          'https://firebasestorage.googleapis.com/v0/b/gk-quiz-app-1584f.appspot.com/o/questions.json?alt=media&token=7090d873-ff86-4e36-9953-a07255d3e013',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? cloudQuestions(dynamic response) => getJsonField(
        response,
        r'''$.questions''',
        true,
      ) as List?;
  static List<String>? cloudSet(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].setID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RandomCallCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'RandomCall',
      apiUrl:
          'https://firebasestorage.googleapis.com/v0/b/gk-quiz-app-1584f.appspot.com/o/questions.json?alt=media&token=7090d873-ff86-4e36-9953-a07255d3e013',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? questData(dynamic response) => getJsonField(
        response,
        r'''$.questions''',
        true,
      ) as List?;
  static List<int>? serial(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].sr_num''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class DailyTestApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'dailyTestApi',
      apiUrl:
          'https://firebasestorage.googleapis.com/v0/b/gk-quiz-app-1584f.appspot.com/o/dailyTest.json?alt=media&token=614d9e2e-82c9-44fb-adee-221cfe55de71',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? questions(dynamic response) => getJsonField(
        response,
        r'''$.questions''',
        true,
      ) as List?;
  static List<String>? question(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].question''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? options(dynamic response) => getJsonField(
        response,
        r'''$.questions[:].options''',
        true,
      ) as List?;
  static List<String>? correctAnswer(dynamic response) => (getJsonField(
        response,
        r'''$.questions[:].correct_answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
