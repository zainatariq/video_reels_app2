import 'package:dio/dio.dart';


//
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // // TODO: handleExceptionDio
    // HandleError.handleException(
    //   response: err.response?.statusCode ?? 0,
    // );
    return super.onError(err, handler);
  }
}
