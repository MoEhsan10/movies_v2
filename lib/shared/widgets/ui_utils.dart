import 'package:flutter/material.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class UIUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorsManager.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            const  CircularProgressIndicator(color: ColorsManager.yellow ,),
              const SizedBox(width: 20),
               Text(
                "Loading...",
                style: AppStyles.appBar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) => Navigator.of(context, rootNavigator: true).pop();



  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}