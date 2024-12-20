import 'package:flutter/material.dart';
import 'package:movies_app_task/core/themes/app_colors.dart';
import '../utils/app_strings.dart';

import '../utils/password_validator.dart';

class PasswordValidationIndicator extends StatefulWidget {
  const PasswordValidationIndicator({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordValidationIndicator> createState() =>
      _PasswordValidationIndicatorState();
}

class _PasswordValidationIndicatorState
    extends State<PasswordValidationIndicator> {
      late String password;

  @override
  void initState() {
    super.initState();
    password = widget.controller.text;
    widget.controller.addListener(_updatePassword);
  }

  void _updatePassword() {
    setState(() {
      password = widget.controller.text;
    });
  }

  @override
  @override
  void dispose() {
    widget.controller.removeListener(_updatePassword);
    super.dispose();
  }


  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child: Row(
            children: [
              Expanded(
                child:
                    _ProgressBar(progress: _calculateProgress(password)),
              ),
              Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ValidationItem(
                  label: AppStrings.passwordMinLength,
                  isValid: PasswordValidator.hasMinLength(password),
                ),
                _ValidationItem(
                  label: AppStrings.passwordOneLowerCase,
                  isValid: PasswordValidator.hasLowercase(password),
                ),
                _ValidationItem(
                  label: AppStrings.passwordOneUpperCase,
                  isValid: PasswordValidator.hasUppercase(password),
                ),
                _ValidationItem(
                  label: AppStrings.passwordOneSpecialChar,
                  isValid: PasswordValidator.hasSpecialChar(password),
                ),
                _ValidationItem(
                  label: AppStrings.passwordOneNumber,
                  isValid: PasswordValidator.hasNumber(password),
                ),
              ],
            ),
          ),
      ],
    );
  }

  double _calculateProgress(String password) {
    int checks = 0;
    if (PasswordValidator.hasMinLength(password)) checks++;
    if (PasswordValidator.hasLowercase(password)) checks++;
    if (PasswordValidator.hasUppercase(password)) checks++;
    if (PasswordValidator.hasSpecialChar(password)) checks++;
    if (PasswordValidator.hasNumber(password)) checks++;
    return checks / 5;
  }
}

class _ProgressBar extends StatelessWidget {
  final double progress;

  const _ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: AppColors.redLight,
        color: AppColors.green,
        minHeight: 6,
      ),
    );
  }
}

class _ValidationItem extends StatelessWidget {
  final String label;
  final bool isValid;

  const _ValidationItem({
    required this.label,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isValid ? AppColors.green : AppColors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isValid ? AppColors.green : AppColors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
