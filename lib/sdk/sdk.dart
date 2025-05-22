import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_constants.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';
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

      final body = api.getBody();
      if (body != null && body is Map<String, dynamic>) {
        body.removeWhere((key, value) => value == null || value == "");
      }

      if (api.isAuth) {
        _dio.options.headers.addAll(await getHeaders());
      }

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
      }

      if (response.data is T) {
        final T resp = response.data as T;

        return Success(resp);
      }

      if (response.data is String) {
        return Error(response.data as String);
      }

      return Error("Erro inesperado");
    } catch (error, stack) {
      print("$error: $stack");
      return Error(error.toString());
    }
  }

  Future<Map<String, String>> getHeaders() async {
    final Map<String, String> req = Map.from(_dio.options.headers);
    final user = await SharedPreferencesController().getLoggedUser();
    req.addAll({"Authorization": "Bearer ${user?.token}"});

    return req;
  }

  Future<bool> logout(BuildContext context) async {
    final result = await SharedPreferencesController().deleteUser();

    if (context.mounted) {
      AutoRouter.of(context).popUntilRoot();
    }

    return result;
  }
}
