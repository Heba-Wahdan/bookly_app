import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServicesFailure extends Failure {
  ServicesFailure(super.errMessage);

  factory ServicesFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServicesFailure("Connection is Timeout");
      case DioExceptionType.sendTimeout:
        return ServicesFailure("Send is Timeout");
      case DioExceptionType.receiveTimeout:
        return ServicesFailure("Receive is Timeout");
      case DioExceptionType.badCertificate:
        return ServicesFailure("Bad Certificate");

      case DioExceptionType.badResponse:
        return ServicesFailure.fromResponse(dioException.response!.statusCode!,
            dioException.response!.statusMessage!);
      case DioExceptionType.cancel:
        return ServicesFailure("Your request was cancelled");
      case DioExceptionType.connectionError:
        return ServicesFailure("Something went wrong with connection");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("Socket Exception")) {
          return ServicesFailure("Bad Certificate");
        }
        return ServicesFailure("Unexpected error, please try again");
      default:
        return ServicesFailure("Ops Something went wrong, please try again!");
    }
  }

  factory ServicesFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServicesFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServicesFailure("Your request is not found, please try again!");
    } else if (statusCode == 500) {
      return ServicesFailure("Internal Server error, please try again later!");
    } else {
      return ServicesFailure("Ops Something went wrong, please try again!");
    }
  }
}
