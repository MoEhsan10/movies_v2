import 'package:flutter/material.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.yellow,
      ),
    );
  }
}
