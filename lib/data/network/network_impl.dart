import 'package:dio/dio.dart';
import 'package:flutter_template/utils/navigator.dart';
import 'package:flutter_template/utils/shared_preference.dart';

import 'api_response.dart';
import 'network.dart';

class Network {
  static int _timeOut = 10000; //10s
  static BaseOptions options =
      BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut, baseUrl: ApiConstant.apiHost);
  static Dio _dio = Dio(options);

  Network._internal() {
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestHeader: true));
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (Options myOption) async {
      String token = await SharedPreferenceUtil.getToken();
      print("===_internal =====${token}");
      if (token.isNotEmpty) {
        myOption.headers["Authorization"] = "Bearer " + token;
      }
      return myOption;
    }));
  }

  static final Network instance = Network._internal();

  Future<Response<ApiResponse>> get({String url, Map<String, dynamic> params = const {}}) async {
    try {
      Response response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json),
      );
      return getApiResponse(response);
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
      return getError(e);
    }
  }

  Future<Response<ApiResponse>> post(
      {String url,
      Object body = const {},
      Map<String, dynamic> params = const {},
      String contentType = Headers.jsonContentType}) async {
    try {
      Response response = await _dio.post(
        url,
        data: body,
        queryParameters: params,
        options: Options(responseType: ResponseType.json, contentType: contentType),
      );
      return getApiResponse(response);
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
      return getError(e);
    }
  }

  Response<ApiResponse> getError(DioError e) {
    switch (e.type) {
      case DioErrorType.CANCEL:
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.DEFAULT:
        return Response<ApiResponse>(data: ApiResponse.error("error_api.connect"));
      default:
        return Response<ApiResponse>(data: ApiResponse.error("error_api.default"));
    }
  }

  Response<ApiResponse> getApiResponse(Response response) {
    // case token expired
    switch (response.data["code"]) {
      case "005":
      case "006":
        handleTokenExpired();
    }
    var result;
    var returnValue;
    try {
      result = response.data["map"]["PO_RESULT"];
      returnValue = response.data["map"]["return_value"];
    } catch (e) {}
    return Response<ApiResponse>(
        data: ApiResponse.success(
            data: response.data["map"],
            code: response.data["code"],
            result: result,
            returnValue: returnValue,
            message: response.data["code"]));
  }

  void handleTokenExpired() async {
    NavigationService.instance.showDialogTokenExpired();
    await SharedPreferenceUtil.clearData();
  }
}
