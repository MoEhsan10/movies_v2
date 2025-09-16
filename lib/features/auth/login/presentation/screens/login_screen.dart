import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:movies_v2/features/auth/login/presentation/cubit/login_states.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';
import 'package:movies_v2/shared/widgets/ui_utils.dart';
import 'package:movies_v2/shared/widgets/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginLoading) {
              UIUtils.showLoading(context);
            } else if (state is LoginSuccess) {
              UIUtils.hideLoading(context);
              Navigator.of(context).pushReplacementNamed(Routes.main);
            } else if (state is LoginError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(context, state.message);
            }
          },
          child: Padding(
            padding: REdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.logo,
                    width: 250.w,
                    height: 250.h,
                  ),
                  SizedBox(height: 35.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          hintStyle: AppStyles.hintText,
                          prefixIcon: const ImageIcon(
                            AssetImage(ImageAssets.email),
                          ),
                          validator: AppValidators.validateEmail,
                        ),
                        SizedBox(height: 22.h),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                          hintStyle: AppStyles.hintText,
                          isPassword: true,
                          prefixIcon: const ImageIcon(
                            AssetImage(ImageAssets.password),
                          ),
                          validator: AppValidators.validatePassword,
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.forgetPassword);
                          },
                          child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                'Forget Password ?',
                                style: AppStyles.suggestion,
                              )),
                        ),
                        SizedBox(height: 30.h),
                        CustomElevatedButton(
                          label: 'Login',
                          onTap: _handleLogin,
                          textStyle: AppStyles.elevatedButton,
                        ),
                        SizedBox(height: 22.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t Have Account ? ',
                              style: AppStyles.suggestion
                                  .copyWith(color: ColorsManager.white),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.register);
                                },
                                child: Text(
                                  'Create One',
                                  style: AppStyles.suggestion,
                                )),
                          ],
                        ),
                        SizedBox(height: 27.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 91.8.w,
                              height: 1.h,
                              color: ColorsManager
                                  .yellow, // Simple color property for solid color
                            ),
                            SizedBox(width: 10.w),
                            Text('OR', style: AppStyles.suggestion),
                            SizedBox(width: 10.w),
                            Container(
                              width: 91.8.w,
                              height: 1.h,
                              color: ColorsManager
                                  .yellow, // Simple color property for solid color
                            ),
                          ],
                        ),
                        SizedBox(height: 22.h),
                        CustomElevatedButton(
                          label: 'Login With Google',
                          onTap: () {},
                          textStyle: AppStyles.elevatedButton,
                          prefixIcon:
                              const ImageIcon(AssetImage(ImageAssets.google)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
