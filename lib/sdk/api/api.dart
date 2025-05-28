import 'package:ct_morvan_app/sdk/api/enum_code_api.dart';
import 'package:ct_morvan_app/sdk/sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class Api<T, R> {
  Future<Result<R, String>> execute() async {
    final response = await getSdk.executeApi<T>(this);

    switch (response) {
      case Success<T, String>():
        try {
          final resp = getResponseApi(response.success);
          return Success(resp);
        } catch (ex) {
          return Error(ex.toString());
        }
      case Error<T, String>():
        final resp = response.error;
        return Error(resp);
    }
  }

  Object? getBody() {
    return null;
  }

  HttpMethod getMethod() {
    return HttpMethod.get;
  }

  @protected
  R getResponseApi(T data);

  String getUrl();

  bool get isAuth => true;

  Map<String, dynamic> getParameters() {
    return {};
  }

  bool isValidStatusCode(int? statusCode) {
    if (statusCode != null) {
      return EnumCodeApi.getCodeApi(statusCode: statusCode).isValidStatusCode();
    }

    return false;
  }
}

enum HttpMethod { get, post, delete }
