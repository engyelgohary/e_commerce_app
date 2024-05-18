import 'package:e_commerce_app/generated/assets.dart';
import 'package:e_commerce_app/utils/alertDialog/alert_dialog.dart';
import 'package:e_commerce_app/utils/customtextfield/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/dip.dart';
import '../../../utils/theme/my_colors.dart';
import 'cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  RegisterCubit viewModel = RegisterCubit(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener(
    bloc: viewModel,
      listener:(context, state) {
        if(state is RegisterLoading){
          DialogUtils.showLoading(context,'loading');
        } else if(state is RegisterError){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,title: 'Error');
        }else if(state is RegisterSuccess){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage( context,state.registerResponseEntity.user!.name??"",title: 'Success');
        }
      },
        child:Scaffold(
          body: Container(
            color: Theme.of(context).primaryColor,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                    child: Image.asset(
                      Assets.logo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Form(
                            key: viewModel.formKey,
                            child: Column(
                              children: [
                                TextFieldItem(
                                  fieldName: 'Full Name',
                                  hintText: 'enter your name',
                                  controller: viewModel.nameController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your name';
                                    }
                                    return null;
                                  }, keyboardType:TextInputType.name ,
                                ),
                                TextFieldItem(
                                  fieldName: 'E-mail address',
                                  hintText: 'enter your email address',
                                  controller: viewModel.emailController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your email address';
                                    }
                                    bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value);
                                    if (!emailValid) {
                                      return 'invalid email';
                                    }
                                    return null;
                                  }, keyboardType: TextInputType.emailAddress,
                                ),
                                TextFieldItem(
                                  fieldName: 'Password',
                                  hintText: 'enter your password',
                                  controller: viewModel.passwordController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter password';
                                    }
                                    if (value.trim().length < 6 ||
                                        value.trim().length > 30) {
                                      return 'password should be >6 & <30';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure:viewModel.isObscure,
                                  suffixIcon: InkWell(
                                    child: viewModel.isObscure
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onTap: () {
                                      if (viewModel.isObscure) {
                                        viewModel.isObscure = false;
                                      } else {
                                        viewModel.isObscure = true;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                                TextFieldItem(
                                  fieldName: 'Confirmation Password',
                                  hintText: 'enter your confirmationPassword',
                                  controller: viewModel.confirmationPasswordController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter rePassword';
                                    }
                                    if (value != viewModel.passwordController.text) {
                                      return "Password doesn't match";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure: viewModel.isObscure,
                                  suffixIcon: InkWell(
                                    child: viewModel.isObscure
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onTap: () {
                                      if (viewModel.isObscure) {
                                        viewModel.isObscure = false;
                                      } else {
                                        viewModel.isObscure = true;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                                TextFieldItem(
                                  fieldName: 'Mobile Number',
                                  hintText: 'enter your mobile no',
                                  controller: viewModel.phoneController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'please enter your mobile no';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.h),
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.register();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                            child: SizedBox(
                              height: 64.h,
                              width: 398.w,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );

  }
}