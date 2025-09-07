import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';
import 'package:movies_v2/shared/widgets/validators.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorsManager.yellow
        ),
        backgroundColor: ColorsManager.black,
        elevation: 0,
        centerTitle: true,
        title: Text('Pick Avatar',style: AppStyles.appBar,),
      ),
      body: Padding(
        padding:  REdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55.w,
              backgroundImage: const AssetImage(ImageAssets.gamerProfile),
            ),
            SizedBox(height: 35.h),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'Email',
              hintStyle: AppStyles.hintText,
              prefixIcon: const ImageIcon(AssetImage(ImageAssets.email)),
              validator: AppValidators.validateEmail,
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
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('Reset Password',style: AppStyles.suggestion.copyWith(
                color: ColorsManager.white,
                fontSize: 20.sp
              ),),
            ),
            const Spacer(),
            Column(
              children: [
                CustomElevatedButton(
                  label: 'Delete Account',
                  onTap: () {},
                  textStyle: AppStyles.elevatedButton.copyWith(color: ColorsManager.white),
                  backgroundColor: ColorsManager.red,
                ),
                SizedBox(height: 17.h),
                CustomElevatedButton(
                  label: 'Update Data',
                  onTap: () {},
                  textStyle: AppStyles.elevatedButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
