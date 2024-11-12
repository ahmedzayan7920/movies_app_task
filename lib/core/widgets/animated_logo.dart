import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app/app_images.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppImages.animatedLogo,
      width: 60,
      height: 60,
    );
  }
}
