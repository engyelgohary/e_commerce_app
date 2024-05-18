import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entites/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entites/failures.dart';

abstract class AuthRepository{
 Future<Either<Failures,RegisterResponseEntity>>register(String name,String email,String password,String rePassword,String phone);
}