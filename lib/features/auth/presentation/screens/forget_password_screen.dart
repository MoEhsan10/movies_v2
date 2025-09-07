import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(
          color: ColorsManager.yellow,

        ),
        elevation: 0,
        backgroundColor: ColorsManager.black,
        title: Text('Forget Password',
          style: AppStyles.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:  REdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(ImageAssets.forgetPassword),
              CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Email',
                hintStyle: AppStyles.hintText,
                prefixIcon: const ImageIcon(AssetImage(ImageAssets.email)),
              ),
              SizedBox(height: 22.h),
              CustomElevatedButton(
                label: 'Verify Email',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
