import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/password_validator.dart';
import '../../logic/form_validation_provider.dart';

class PasswordValidationIndicator extends StatefulWidget {
  const PasswordValidationIndicator({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordValidationIndicatorState();
}

class _PasswordValidationIndicatorState
    extends State<PasswordValidationIndicator> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormValidationProvider>(
      builder: (context, formProvider, _) {
        final password = formProvider.passwordState.password;
        final progress = _calculateProgress(password);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _toggleExpanded,
              child: Row(
                children: [
                  Expanded(
                    child: _ProgressBar(progress: progress),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
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
                      label: 'At least 8 characters',
                      isValid: PasswordValidator.hasMinLength(password),
                    ),
                    _ValidationItem(
                      label: 'One lowercase letter',
                      isValid: PasswordValidator.hasLowercase(password),
                    ),
                    _ValidationItem(
                      label: 'One uppercase letter',
                      isValid: PasswordValidator.hasUppercase(password),
                    ),
                    _ValidationItem(
                      label: 'One special character',
                      isValid: PasswordValidator.hasSpecialChar(password),
                    ),
                    _ValidationItem(
                      label: 'One number',
                      isValid: PasswordValidator.hasNumber(password),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
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
        backgroundColor: Colors.red.shade300,
        color: Colors.green,
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
            color: isValid ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isValid ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
