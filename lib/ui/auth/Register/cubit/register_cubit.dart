import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entites/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/use%20cases/regiister_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  RegisterUseCase registerUseCase;
  void register() async {
    emit(RegisterLoading());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);
    either.fold((l) => emit(RegisterError(errorMessage: l.errorMessage)),
        (r) => emit(RegisterSuccess(registerResponseEntity: r)));
  }
}
