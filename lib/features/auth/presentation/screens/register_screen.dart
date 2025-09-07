import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';
import 'package:movies_v2/shared/widgets/validators.dart';

import '../../../../shared/resources/assets_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        elevation: 0,
        title: Text(
          'Register',
          style: AppStyles.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: REdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 55.w,
                          backgroundImage: const AssetImage(ImageAssets.gamerProfile),
                        ),
                      ),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 22.h),
                  Text('Avatar', style: AppStyles.hintText),
                  SizedBox(height: 24.h),

                  CustomTextFormField(
                    controller: _nameController,
                    hintText: 'Name',
                    hintStyle: AppStyles.hintText,
                    prefixIcon: const ImageIcon(AssetImage(ImageAssets.name)),
                    validator: AppValidators.validateFullName,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    hintStyle: AppStyles.hintText,
                    prefixIcon: const ImageIcon(AssetImage(ImageAssets.email)),
                    validator: AppValidators.validateEmail,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    hintStyle: AppStyles.hintText,
                    prefixIcon: const ImageIcon(AssetImage(ImageAssets.password)),
                    validator: AppValidators.validatePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    hintStyle: AppStyles.hintText,
                    prefixIcon: const ImageIcon(AssetImage(ImageAssets.password)),
                    validator: (value) => AppValidators.validateConfirmPassword(value, _passwordController.text),
                    isPassword: true,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    hintStyle: AppStyles.hintText,
                    prefixIcon: const ImageIcon(AssetImage(ImageAssets.phone)),
                    validator: AppValidators.validatePhoneNumber,
                  ),
                  SizedBox(height: 24.h),

                  CustomElevatedButton(
                    label: 'Create Account',
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // Handle form submission
                      //   print('Form is valid');
                      // }
                    },
                    textStyle: AppStyles.elevatedButton,
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account ? ',
                        style: AppStyles.suggestion.copyWith(color: ColorsManager.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        child: Text('Login', style: AppStyles.suggestion),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}