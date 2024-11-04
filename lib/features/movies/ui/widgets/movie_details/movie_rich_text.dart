import 'package:flutter/material.dart';

class MovieRichText extends StatelessWidget {
  const MovieRichText({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }
}
