import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final EdgeInsets? padding;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.elevation,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.secondary,
        foregroundColor: textColor ?? Theme.of(context).colorScheme.onSecondary,
        elevation: elevation ?? 0,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text.toUpperCase()),
    );
  }
}
