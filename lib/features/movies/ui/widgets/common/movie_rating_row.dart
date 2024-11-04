
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieRatingRow extends StatelessWidget {
  const MovieRatingRow({
    super.key,
    required this.voteAverage,
    required this.voteCount,
  });

  final double voteAverage;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.shade(
          child: Icon(
            Icons.star_rounded,
            color: Colors.yellow[800],
          ),
        ),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '($voteCount)',
          style: TextStyle(
            color: Colors.grey[350],
          ),
        ),
      ],
    );
  }
}
