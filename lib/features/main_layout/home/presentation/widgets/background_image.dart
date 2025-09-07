import 'package:flutter/material.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Background image
          Image.asset(
            ImageAssets.warMovie1917,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Shadow overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.465, 1.0],
                colors: [
                  Color.fromRGBO(18, 19, 18, 0.8), // rgba(18, 19, 18, 0.8) at 0%
                  Color.fromRGBO(18, 19, 18, 0.6), // rgba(18, 19, 18, 0.6) at 46.5%
                  Color(0xFF121312),                // #121312 at 100%
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
