
class ApiResponse<T> {
  String? message;
  int? code;
  T? data;
  int? status;
  String? errMessage;

  ApiResponse.success({
    this.data,
    this.code,
    this.message,
    this.status,
    this.errMessage
  });

  ApiResponse.error(this.message, {this.data, this.code});

  bool get isSuccess => code != null && code == 200;
  bool get isStatusSuccess => status == 200;
}
