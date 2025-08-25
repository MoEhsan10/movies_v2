import 'package:flutter/material.dart';

class OnBoardingData extends StatelessWidget {
  const OnBoardingData({super.key, required this.color, required this.urlImage});

  final Color color;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}