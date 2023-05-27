import 'dart:io';

import 'package:chilled_haven/core/api/rest_client.dart';
import 'package:chilled_haven/core/api/via_cep_client.dart';
import 'package:chilled_haven/core/models/product_rest_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../models/user_rest_model.dart';
import '../storages/token_storage.dart';

class ApiUtil {

  static Dio getHttpClient({String? token}) {
    final dio = Dio();
    var adapter = dio.httpClientAdapter as IOHttpClientAdapter;

    adapter.onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    if (token != null) dio.options.headers["Authorization"] = "Bearer $token";

    return dio;
  }

  static Future<RestClient> getRestClient({bool withToken = false}) async {
    final tokenRetrieved = await TokenStorage.retrieveUserToken();
    return RestClient(getHttpClient(token: tokenRetrieved));
  }

  /// SWITCH ERROR REQUEST
  static void getRuntimeError(Object obj) {
    // non-200 error goes here.
    switch (obj.runtimeType) {
      case DioError:
      // Here's the sample to get the failed response error code and message
        final res = (obj as DioError).response;
        print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
        break;
      default:
        break;
    }
  }

  /// VIACEP REQUEST
  static Future<ViaCepClient> getViaCepClient() async => ViaCepClient(Dio());

  /// USERS
  static Future<UserRestModel?> getUser() async {
    try {
      final client = await getRestClient(withToken: true);
      final user = await client.getUser();
      return user;
    } catch(obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    }
    return null;
  }

  static Future<String?> loginUser(String email, String password) async {
    try {
      final client = await getRestClient();
      final token = await client.loginUser({"email": email, "password": password});
      return token;
    } catch(obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    }
    return null;
  }

  static Future<bool> registerUser(UserRestModel registration) async {
    try {
      final client = await getRestClient();
      await client.registrationUser(registration);
      return true;
    } catch(obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    }
    return false;
  }
}