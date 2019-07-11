import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:login_register/ui/networking/response/user.dart';
import 'package:login_register/utlities/app_constants.dart';
import 'package:login_register/utlities/strings.dart';

class Api {
  final String STAGING_BASE_URL = "https://reqres.in";
  final String PRODUCTION_BASE_URL = "https://reqres.in";
  //String url = '';
  Dio dio;
  Logger logger;

  Api.initialize() {
    //url = AppConstants.isDebug ? STAGING_BASE_URL : PRODUCTION_BASE_URL;
    dio = Dio()
      ..options.baseUrl =
          AppConstants.isDebug ? STAGING_BASE_URL : PRODUCTION_BASE_URL
      ..options.connectTimeout = 60000
      ..options.receiveTimeout = 60000
      ..interceptors.add(AppConstants.isDebug
          ? LogInterceptor(requestBody: true, responseBody: true)
          : null)
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
//          return dio.resolve("fake data");
        if (!AppConstants.isMock) {
          return options;
        }
        print('options are ${options.path}');
        switch (options.path) {
          case '/api/login':
            rootBundle
                .loadString('assets/json/login_success.json')
                .then((String mockedData) {
              print('mocked data is $mockedData}');
              return dio.resolve(mockedData);
            });
            break;
        }
      }, onError: (DioError e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        /// Response info, it may be `null` if the request can't reach to
        /// the http server, for example, occurring a dns error, network is not available.
        logger.e('''Error message is ${e.message}
                  Error type is ${e.type}
                  Error is ${e.error}
                  For request ${e.request}
                  And Response ${e.response != null ? 'request => ${e.response.request} and data => ${e.response.data} headers => ${e.response.headers}' : 'request is ${e.request}'}
                  Stacktrace is ${e.stackTrace}''');
        //TODO you can create your own Error Object and pass to view
        return e.response != null
            ? e.response.data.toString()
            : Strings.something_went_wrong;
      }));

    logger = Logger();
  }

  ///SignIn
  Future<Object> singIn(String path, {Map body}) async {
    try {
      Response response = await dio.post(path, data: body, options: Options());
      //final int statusCode = response.statusCode;
      return User.fromJson(response.data);
    } on DioError catch (e) {}
  }

  ///Create User
  Future<User> createUserDio(String path, {Map body}) async {
    return dio.post(path, data: body).then((Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return User.fromJson(response.data);
    });
  }

//  //Headers demo
//  Future<User> getUsersWithAuthentication(String path, {Map body},SharedPreferences prefs) async {
//    try {
//      Response response = await dio.post(path,
//          data: body,
//          options: Options(headers: {
//            AppConstants.AUTHORIZATION: prefs.getToken,
//          }));
//      final int statusCode = response.statusCode;
//      if (statusCode < 200 || statusCode > 400) {
//        throw new Exception("Error while fetching data");
//      }
//      return User.fromJson(response.data);
//    } on DioError catch (e) {
//      // The request was made and the server responded with a status code
//      // that falls out of the range of 2xx and is also not 304.
//      /// Response info, it may be `null` if the request can't reach to
//      /// the http server, for example, occurring a dns error, network is not available.
//      logger.e('''Error message is ${e.message}
//                  Error type is ${e.type}
//                  Error is ${e.error}
//                  For request ${e.request}
//                  And Response ${e.response != null ? 'request => ${e.response.request} and data => ${e.response.data} headers => ${e.response.headers}' : 'request is ${e.request}'}
//                  Stacktrace is ${e.stackTrace}''');
//    }
//  }
}
