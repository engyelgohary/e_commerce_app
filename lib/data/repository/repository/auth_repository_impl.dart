import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entites/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entites/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone){
  return authRemoteDataSource.register(name, email, password, rePassword, phone);
  }

}