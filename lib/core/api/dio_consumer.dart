import 'dart:convert';
import 'dart:developer';
 import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:video_reels_app/core/api/status_code.dart';

import '../error/execptions.dart';
import '../util/app_strings.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  String? token ='';

  DioConsumer({required this.client}) {


    client.interceptors.add((PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      logPrint: (object) {
        log(
          object.toString(),
          name: "log ::=>",
        );
      },
    )));

    client.interceptors.add(AppIntercepters());

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false

      ..responseType = ResponseType.plain

      ..headers = {};

  }


  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters,

      );
      return _handleResponseAsJson(response);

    } on DioException catch (error) {

      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
        bool formDataIsEnabled = false,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          options: Options(
            contentType: 'multipart/form-data',
          ),

          data: formDataIsEnabled ? FormData.fromMap(body!) : body


      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
      await client.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    try {
      return jsonDecode(response.data.toString()); // Attempt to decode JSON
    } catch (e) {
      return response.data; // Return the plain text response if decoding fails
    }
  }


  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
      // Log detailed request and response info
        log('Dio Error - Unknown');
        log('Request URL: ${error.requestOptions.uri}');
        log('Request Method: ${error.requestOptions.method}');
        log('Request Headers: ${error.requestOptions.headers}');
        log('Request Data: ${error.requestOptions.data}');

        if (error.response != null) {
          log('Response Status Code: ${error.response?.statusCode}');
          log('Response Data: ${error.response?.data}');
        }
        log('Error Message: ${error.message}');
        log('Stack Trace: ${error.stackTrace}');

        throw DioException(
          requestOptions: error.requestOptions, // Ensure requestOptions is passed
          response: error.response,
          error: error.error,
          type: error.type,
        );
      case DioExceptionType.badCertificate:
        break;
    }
  }

}
