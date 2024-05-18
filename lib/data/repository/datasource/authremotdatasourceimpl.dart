import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/ApiManager.dart';
import 'package:e_commerce_app/domain/entites/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entites/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';

class AuthDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone) async{
 var either = await apiManager.register(name, email, password, rePassword, phone);
 return either.fold(
         (l){
           return Left(l);
         },
         (response) {
           return Right(response.toRegisterResponseEntity());
         });
  }
}