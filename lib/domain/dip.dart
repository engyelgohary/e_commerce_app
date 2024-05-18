import 'package:e_commerce_app/data/api/ApiManager.dart';
import 'package:e_commerce_app/data/repository/datasource/authremotdatasourceimpl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/use%20cases/regiister_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthDataSourceImpl(apiManager: ApiManager.getInstanace());
}
