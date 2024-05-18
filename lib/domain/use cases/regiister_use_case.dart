import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import '../entites/RegisterResponseEntity.dart';
import '../entites/failures.dart';

class RegisterUseCase {
AuthRepository authRepository;
RegisterUseCase({required this.authRepository});
Future<Either<Failures,RegisterResponseEntity>> invoke(String name,String email,String password,String rePassword,String phone){
return authRepository.register(name, email, password, rePassword, phone);
}
}