import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/domain/network/network.dart';
import 'package:flutter_template/utils/navigator.dart';
import 'package:flutter_template/utils/shared_preference.dart';

class Network {
  static const int DEFAULT_TIMEOUT = 15000;
  static BaseOptions options =
      BaseOptions(connectTimeout: DEFAULT_TIMEOUT, receiveTimeout: DEFAULT_TIMEOUT, baseUrl: ApiConstant.apiHost);
  static final Dio _dio = Dio(options);

  Network._internal() {
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: true, requestHeader: true));
    }
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions myOption, RequestInterceptorHandler handler) async {
      String token = await SharedPreferenceUtil.getToken();
      if (token.isNotEmpty) {
        myOption.headers["Authorization"] = "Bearer " + token;
      }
      return handler.next(myOption);
    }));
  }

  static Network instance() {
    return Network._internal();
  }

  Future<ApiResponse> get({required String url, Map<String, dynamic>? params}) async {
    try {
      Response response = await _dio.get(
        url,
        queryParameters: await BaseParamRequest.request(params),
        options: Options(responseType: ResponseType.json),
      );
      return getApiResponse(response);
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
      return getError(e);
    }
  }

  Future<ApiResponse> post(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic> params = const {},
      String contentType = Headers.jsonContentType}) async {
    try {
      Response response = await _dio.post(
        url,
        data: await BaseParamRequest.request(body),
        queryParameters: params,
        options: Options(responseType: ResponseType.json, contentType: contentType),
      );
      return getApiResponse(response);
    } catch (e) {
      print("===post =====${e}");
      return getError(e as DioError);
    }
  }

  ApiResponse getError(DioError e) {
    if (e.response?.statusCode == 401) {
      handleTokenExpired();
    }
    switch (e.type) {
      case DioErrorType.cancel:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.other:
        return ApiResponse.error(
          "error.connection",
        );
      default:
        return ApiResponse.error(e.message, data: getDataReplace(e.response?.data), code: e.response?.statusCode);
    }
  }

  ApiResponse getApiResponse(Response response) {
    return ApiResponse.success(
        data: response.data,
        code: response.statusCode,
        status: response.data is Map<String, dynamic> ? response.data["Status"] : null,
        errMessage: response.data is Map<String, dynamic> ? response.data["ErrMsg"] : null);
  }

  void handleTokenExpired() async {
    NavigationService.instance.showDialogTokenExpired();
  }

  getDataReplace(data) {
    if (data is String) {
      return data.replaceAll("loi:", "").replaceAll(":loi", "").trim();
    }
    return data;
  }
}
