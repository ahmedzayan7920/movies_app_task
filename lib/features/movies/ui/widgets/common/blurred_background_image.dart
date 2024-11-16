import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';

class BlurredBackgroundImage extends StatelessWidget {
  const BlurredBackgroundImage({
    super.key,
    required this.imageUrl,
    required this.child,
    this.withBackArrow = false,
  });

  final String imageUrl;
  final Widget child;
  final bool withBackArrow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: AppColors.black.withOpacity(0.6),
            ),
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: child,
          ),
        ),
        withBackArrow
            ? PositionedDirectional(
                top: 0,
                start: 0,
                child: SafeArea(
                  child: Skeleton.keep(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
