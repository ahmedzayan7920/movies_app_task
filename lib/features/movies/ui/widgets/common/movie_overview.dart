import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    super.key,
    required this.overview,
    this.maxLines,
  });

  final String overview;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      maxLines: maxLines,
      textAlign: TextAlign.justify,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
