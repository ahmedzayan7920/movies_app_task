import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/localization/logic/language_provider.dart';
import '../../../../../core/localization/logic/language_state.dart';

class LanguageDrawer extends StatelessWidget {
  const LanguageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final state = languageProvider.state;

    // Get the currently selected language code
    String? selectedLanguageCode;
    if (state is LanguageLoaded) {
      selectedLanguageCode = state.locale.languageCode;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Settings',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          const ListTile(
            title: Text('Language'),
          ),
          ...languageProvider.supportedLanguages.map((language) {
            final languageCode = language['code']!;
            final languageLabel = language['label']!;

            return RadioListTile<String>(
              title: Text(languageLabel),
              value: languageCode,
              groupValue: selectedLanguageCode,
              onChanged: (newLanguageCode) {
                if (newLanguageCode != null) {
                  languageProvider.changeLanguage(newLanguageCode);
                  Navigator.pop(context); // Close drawer after selection
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
