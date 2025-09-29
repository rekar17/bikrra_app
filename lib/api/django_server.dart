import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retry/retry.dart';

class DjangoServer {
  static const String baseUrl = 'http://127.0.0.1:8000/bikrra';
  static const String assetUrl = 'http://127.0.0.1:8000';
  static const String api = '/api';
  static const int maxRetryAttempts = 3;

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl + api,
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      contentType: 'application/json',
      maxRedirects: 1,
      headers: {
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo4ODExOTQ5MjU2MSwiaWF0IjoxNzE5NTc4OTYxLCJqdGkiOiJjODgwZTc2MmY5YWY0ZjhlOTI4NWFlMTYxZjc5NDY3YyIsInVzZXJfaWQiOjR9.jKYKzMIaMlDbpV89y0gbjFI1mxye7_FzPVC_jfQvLY8',
        'Connection': 'keep-alive',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<dynamic> get(
    String url,
    Map<String, dynamic>? queryParameters,
  ) async {
    int retryAttempt = 0;
    while (retryAttempt < maxRetryAttempts) {
      try {
        final response = await dio.get(
          baseUrl + api + url,
          queryParameters: queryParameters,
        );
        return response.data;
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout &&
            retryAttempt < maxRetryAttempts - 1) {
          retryAttempt++;
          continue;
        }
        if (kDebugMode) {
          print(e);
        }
        return null;
      }
    }
    return null;
  }

  static dynamic post(String url, {dynamic data}) async {
    int retryAttempt = 0;
    while (retryAttempt < maxRetryAttempts) {
      try {
        final response = await dio.post(
          baseUrl + api + url,
          data: data,
          onReceiveProgress: (received, total) {
            if (kDebugMode) {
              print('received: $received, total: $total');
            }
          },
          //if the url is /login/ then don't add the base url
          options: Options(
            method: 'POST',
            headers: {
              'Connection': 'keep-alive',
            },
          ),
        );
        return response.data;
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout &&
            retryAttempt < maxRetryAttempts - 1) {
          retryAttempt++;
          continue;
        }
        if (kDebugMode) {
          print(e);
        }
        return null;
      }
    }
    return null;
  }

  //login (without retry attempts)
  static dynamic login(String url, {dynamic data}) async {
    try {
      final response = await retry(
        () => Dio(
          BaseOptions(
            baseUrl: baseUrl + api,
            contentType: 'application/json',
            connectTimeout: const Duration(seconds: 3),
            headers: {
              'Connection': 'keep-alive',
            },
          ),
        ).post(
          baseUrl + api + url,
          data: data,
        ),
        maxDelay: const Duration(seconds: 3),
        retryIf: (e) =>
            e is DioException || e is TimeoutException || e is SocketException,
        maxAttempts: 3,
        delayFactor: const Duration(seconds: 1),
        onRetry: (e) {
          if (kDebugMode) {
            print(e);
          }
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic put(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.put(
        url,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic delete(String url) async {
    try {
      final response = await dio.delete(
        '$url/',
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic patch(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.patch(
        url,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic upload(String url, String filePath) async {
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap({
          'file': await MultipartFile.fromFile(filePath),
        }),
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic download(String url, String filePath) async {
    try {
      final response = await dio.download(
        url,
        filePath,
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic uploadFiles(String url, List<String> filePaths) async {
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap({
          'files': filePaths
              .map(
                (filePath) => MapEntry(
                  'files',
                  MultipartFile.fromFileSync(filePath),
                ),
              )
              .toList(),
        }),
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static dynamic downloadFiles(String url, List<String> filePaths) async {
    try {
      final response = await dio.download(
        url,
        filePaths.first,
      );
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
