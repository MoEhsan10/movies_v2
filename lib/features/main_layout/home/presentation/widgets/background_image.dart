import 'package:flutter/material.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          imageUrl.isNotEmpty
              ? Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                ImageAssets.warMovie1917,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },

            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.black,
                child: const Center(child: LoadingIndicator()),
              );
            },
          )
              : Image.asset(
            ImageAssets.warMovie1917,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Shadow overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color.fromRGBO(18, 19, 18, 0.6),
                    Color(0xFF121312),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}