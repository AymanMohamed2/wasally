import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout With ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout With ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout With ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('bad Certificate');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.connectionError:
        return ServerFailure('No Internet Connection 🌐');

      case DioErrorType.unknown:
        return ServerFailure('No Internet Connection 🌐');

      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not Found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Ops There was an error, Please try again');
    }
  }
}
