part of 'network_clients.dart';
class NetworkResponse {
  final int statusCode;
  final String? errorMessage;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;

  NetworkResponse({
    required this.statusCode,
    this.errorMessage,
    this.responseData,
    required this.isSuccess,
  });
}
