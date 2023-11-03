class BaseResponseError {
  final String message;

  BaseResponseError({required this.message});

  factory BaseResponseError.fromJson(Map<String, dynamic> json) {
    return BaseResponseError(
      message: json['message'],
    );
  }
}
