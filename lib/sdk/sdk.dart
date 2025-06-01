import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_constants.dart';
import 'package:ct_morvan_app/models/generic_message.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

Sdk? _app;
Sdk get getSdk {
  _app ??= Sdk._private();

  return _app!;
}

class Sdk {
  late final Dio _dio = Dio();

  Sdk._private() {
    _dio.options.baseUrl = baseUrl;
  }

  Future<Result<T, String>> executeApi<T>(Api<dynamic, dynamic> api) async {
    try {
      final parameters = api.getParameters();
      parameters.removeWhere(
        (key, value) => value == null || (value is String && value.isEmpty),
      );

      Object? body = api.getBody();
      if (body != null && body is Map<String, dynamic>) {
        body.removeWhere((key, value) => value == null || value == "");

        body = jsonEncode(body);
        print(body);
      }

      if (api.isAuth) {
        _dio.options.headers.addAll(await getHeaders());
      }

      _dio.options.validateStatus = api.isValidStatusCode;

      Response<T> response;

      switch (api.getMethod()) {
        case HttpMethod.get:
          response = await _dio.get<T>(
            api.getUrl(),
            data: body,
            queryParameters: parameters,
          );
        case HttpMethod.post:
          response = await _dio.post<T>(
            api.getUrl(),
            data: body,
            queryParameters: parameters,
          );
        case HttpMethod.delete:
          response = await _dio.delete<T>(
            api.getUrl(),
            data: body,
            queryParameters: parameters,
          );
        case HttpMethod.put:
          response = await _dio.put<T>(
            api.getUrl(),
            data: body,
            queryParameters: parameters,
          );
      }

      if (response.data is T) {
        final T resp = response.data as T;

        return Success(resp);
      }

      if (response.data is String) {
        return Error(response.data as String);
      }

      return Error("Erro inesperado");
    } on DioException catch (error, stack) {
      print("$error: $stack");
      return Error(createMessageError(error, api));
    } catch (error, stack) {
      print("$error: $stack");
      return Error(error.toString());
    }
  }

  String createMessageError(DioException? error, Api api) {
    if (error != null && error.response?.data is Map<String, dynamic>) {
      GenericMessage message = GenericMessage.fromJson(
        error.response!.data as Map<String, dynamic>,
      );
      return message.message;
    }

    return t.genericError;
  }

  Future<Map<String, String>> getHeaders() async {
    final Map<String, String> req = Map.from(_dio.options.headers);
    final user = await SharedPreferencesController().getLoggedUser();
    req.addAll({
      "Authorization": "Bearer ${user?.token}",
      "Accept": "application/json",
      'Content-Type': 'application/json',
    });

    return req;
  }

  Future<bool> logout(BuildContext context) async {
    final result = await SharedPreferencesController().deleteUser();

    if (context.mounted) {
      AutoRouter.of(context).replaceAll([LoginViewRoute()]);
    }

    return result;
  }
}
