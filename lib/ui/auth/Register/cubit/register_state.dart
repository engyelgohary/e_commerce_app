part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterError extends RegisterState {
  String?errorMessage;
  RegisterError({required this.errorMessage});
}
final class RegisterSuccess extends RegisterState {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccess({required this.registerResponseEntity});
}

