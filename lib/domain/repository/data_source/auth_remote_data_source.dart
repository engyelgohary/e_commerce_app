import 'package:dartz/dartz.dart';
import '../../entites/RegisterResponseEntity.dart';
import '../../entites/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures,RegisterResponseEntity>>register
      (String name,String email,String password,String rePassword,String phone);
}