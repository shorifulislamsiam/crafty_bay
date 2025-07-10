import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_response.dart';

class NetworkClients {
  final String _defaultErrorMassage = "Something went wrong";
  final Logger _logger = Logger();
  final Map<String, String> commonHeaders;
  final VoidCallback onUnAuthorize;

  NetworkClients({required this.commonHeaders, required this.onUnAuthorize});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders);
      final Response response = await get(uri, headers: commonHeaders);
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Un-Authorize",
        );
      } else {
        final responseBody = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseData: responseBody["msg"] ?? _defaultErrorMassage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders, body: body);
      final Response response = await post(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: responseBody["msg"] ?? _defaultErrorMassage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders, body: body);
      final Response response = await put(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: responseBody["msg"] ?? _defaultErrorMassage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders, body: body);
      final Response response = await put(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: responseBody["msg"] ?? _defaultErrorMassage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: commonHeaders, body: body);
      final Response response = await put(
        uri,
        headers: commonHeaders,
        body: jsonEncode(body),
      );
      _logResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Un-Authorized",
        );
      } else {
        final responseBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: responseBody["msg"] ?? _defaultErrorMassage,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    final String message = """
    URL-> $url
    HEADERS->$headers
    BODY->$body
    """;
    _logger.i(message);
  }

  void _logResponse(Response response) {
    final String message = """
    URL->${response.request?.url}
    HEADERS->${response.headers}
    BODY->${response.body}
    """;
    _logger.i(message);
  }
}
