import 'package:flutter/material.dart';
import '../../../../../core/utils/app_keys.dart';
import 'package:provider/provider.dart';

import '../../../../../core/localization/logic/language_provider.dart';
import '../../../../../core/localization/logic/language_state.dart';
import '../../../../../core/utils/app_strings.dart';

class LanguageDrawer extends StatelessWidget {
  const LanguageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final state = languageProvider.state;

    String? selectedLanguageCode;
    if (state is LanguageLoaded) {
      selectedLanguageCode = state.locale.languageCode;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              AppStrings.settingsTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            title: Text(AppStrings.languageTitle),
          ),
          ...languageProvider.supportedLanguages.map((language) {
            final languageCode = language[AppKeys.languageCode]!;
            final languageLabel = language[AppKeys.languageLabel]!;

            return RadioListTile<String>(
              title: Text(languageLabel),
              value: languageCode,
              groupValue: selectedLanguageCode,
              onChanged: (newLanguageCode) {
                if (newLanguageCode != null) {
                  languageProvider.changeLanguage(newLanguageCode);
                  Navigator.pop(context);
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
