class BaseResponseData<T> {
  bool? success;
  String? code;
  String? message;
  T? data;

  BaseResponseData({this.success, this.code, this.message, this.data});

  factory BaseResponseData.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) createT) {
    return BaseResponseData<T>(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      data: createT(json['data']),
    );
  }
}