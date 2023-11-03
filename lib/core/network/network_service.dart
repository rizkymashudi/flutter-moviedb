import 'package:dio/dio.dart';
import 'package:moovidb/core/constant/constant.dart';
import 'package:moovidb/core/network/api_factory.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  Future<T> get<T>(ApiEndpoint endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await _dio.get('${ApiConstants.baseUrl}/${endpoint.path}?api_key=${ApiConstants.apiKey}');
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw ApiException(response.statusCode ?? -1, response.statusMessage ?? 'Unknown error');
      }
    } catch (error) {
      throw handleApiError(error);
    }
  }

  ApiException handleApiError(dynamic error) {
    if (error is DioError) {
      final response = error.response;
      if (response != null) {
        return ApiException(response.statusCode ?? -1, response.statusMessage ?? 'Unknown error');
      } else {
        return ApiException(-1, 'Network error');
      }
    } else {
      return ApiException(-1, 'An error occurred');
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException: $statusCode - $message';
  }
}
