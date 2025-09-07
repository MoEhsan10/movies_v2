import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton(
      {super.key,
      this.prefixIcon,
      this.textStyle,
      this.isStadiumBorder = true,
      this.backgroundColor,
      this.foregroundColor,
      this.radius,
      this.suffixIcon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ,
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
          backgroundColor: backgroundColor ?? ColorsManager.lightYellow,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 10.w,
            ),
            Text(
              label,
              style: textStyle ?? AppStyles.elevatedButton
            ),
            SizedBox(
              width: 27.w,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
