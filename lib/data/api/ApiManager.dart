import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/request/RegisterResquest.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/entites/failures.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  // https://ecommerce.routemisr.com/api/v1/auth/signup
  static const String baseUrl = 'ecommerce.routemisr.com';
  static const String registerApi = '/api/v1/auth/signup';
}

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstanace(){
    _instance??= ApiManager._();
    return _instance!;
  }
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      }else {
        return Left(ServerError(errorMessage: 'Account Already Exists'));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please Check Internet Connections'));
    }
  }
}
