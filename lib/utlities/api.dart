import 'package:dio/dio.dart';
import 'package:login_register/ui/networking/response/user.dart';
import 'package:login_register/utlities/app_constants.dart';

class Api {
  final String STAGING_BASE_URL = "https://reqres.in";
  final String PRODUCTION_BASE_URL = "https://reqres.in";
  String url = '';
  Dio dio;

  Api.initialize() {
    url = AppConstants.isDebug ? STAGING_BASE_URL : PRODUCTION_BASE_URL;
    dio = new Dio();
  }

  ///SignIn
  Future<User> singIn(String path, {Map body}) async {
    return dio.post(url + path, data: body).then((Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return User.fromJson(response.data);
    });
  }

  ///Create User
  Future<User> createUserDio(String path, {Map body}) async {
    return dio.post(url + path, data: body).then((Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return User.fromJson(response.data);
    });
  }
}
