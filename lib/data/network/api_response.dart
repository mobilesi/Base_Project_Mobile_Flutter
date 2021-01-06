class ApiResponse<T> {
  String message;
  String code;
  String result;
  String returnValue;
  T data;

  ApiResponse.success({this.data, this.code, this.message, this.result, this.returnValue});
  ApiResponse.error(this.message);

  bool get isSuccess => this.code != null && this.code == "200";
  bool get isResultSuccess => this.result != null && this.result == "TRUE";
  bool get isReturnValueSuccess => this.returnValue != null && this.returnValue == '0';
}
