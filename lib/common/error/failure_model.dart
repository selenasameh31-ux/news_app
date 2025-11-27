import 'package:dio/dio.dart';

abstract class FailureModel implements Exception {
  String errorMEssage;
  int? statesCode;
  FailureModel({required this.errorMEssage, this.statesCode});
  @override
  String toString() {
    
    return errorMEssage;
  }

  static FailureModel getNetworkFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return BaseFailure(errorMEssage: 'Bad network connection!!');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
        return BaseFailure(errorMEssage: 'Server Error!');
      case DioExceptionType.connectionError:
        return BaseFailure(errorMEssage: 'No internet connection!');
      case DioExceptionType.unknown:
        return BaseFailure(errorMEssage: 'something went wrong');
    }
  }
}

class BaseFailure extends FailureModel {
  BaseFailure({required super.errorMEssage, super.statesCode});
}
