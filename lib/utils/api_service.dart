// Package imports:
import 'package:dio/dio.dart';

class ApiService {
  // Singleton creation
  ApiService._();
  static final ApiService _instance = ApiService._();
  factory ApiService() => _instance;

  final _dio = Dio();

  final String _baseUrl = 'http://www.themealdb.com/api/json/v1/';

  static const String _apiKey = '1';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl/$_apiKey/$endPoint');

    return response.data;
  }
}

// abstract class ApiFailure {
//   final String errMessage;
//   const ApiFailure(this.errMessage);
// }

// class ServerFailure extends ApiFailure {
//   ServerFailure(super.errMessage);

//   factory ServerFailure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure('Connection timed out');
//       case DioExceptionType.sendTimeout:
//         return ServerFailure('Send request timed out');

//       case DioExceptionType.receiveTimeout:
//         return ServerFailure('Recieve request timed out');

//       case DioExceptionType.badCertificate:
//         return ServerFailure('Bad certificate');

//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//             dioException.response!.statusCode!, dioException.response!.data);
//       case DioExceptionType.cancel:
//         return ServerFailure('Request cancelled');

//       case DioExceptionType.connectionError:
//         return ServerFailure('No internet connection');

//       case DioExceptionType.unknown:
//         return ServerFailure(
//             'An unknown error has occured.\nPlease try again later.');

//       default:
//         return ServerFailure(
//             'Oops! There was an error.\nPlease try again later.');
//     }
//   }

//   factory ServerFailure.fromResponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure(
//           'Your request has not been found.\nPlease try again later');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internal server erorr\nPlease try again later');
//     } else {
//       return ServerFailure(
//           'Oops! An error has occured.\nPlease try again later.');
//     }
//   }
// }
