enum EnumCodeApi {
  info,
  success,
  redirect,
  clientError,
  serverError;

  static EnumCodeApi getCodeApi({required int statusCode}) {
    if (statusCode >= 200 && statusCode <= 299) {
      return success;
    } else if (statusCode >= 100 && statusCode <= 199) {
      return info;
    } else if (statusCode >= 300 && statusCode <= 399) {
      return redirect;
    } else if (statusCode >= 400 && statusCode <= 499) {
      return clientError;
    }

    return serverError;
  }

  bool isValidStatusCode(){
    return this != serverError && this != clientError;
  }
}
