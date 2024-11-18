import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/logic/language_bloc.dart';
import '../../../../../core/localization/logic/language_event.dart';
import '../../../../../core/localization/logic/language_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_keys.dart';
import '../../../../../core/utils/app_strings.dart';

class LanguageDrawer extends StatelessWidget {
  const LanguageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              String? selectedLanguageCode;
              if (state is LanguageLoaded) {
                selectedLanguageCode = state.locale.languageCode;
              }

              final languageBloc = context.read<LanguageBloc>();
              return Column(
                children: AppConstants.supportedLanguages.map((language) {
                  final languageCode = language[AppKeys.languageCode]!;
                  final languageLabel = language[AppKeys.languageLabel]!;

                  return RadioListTile<String>(
                    title: Text(languageLabel),
                    value: languageCode,
                    groupValue: selectedLanguageCode,
                    onChanged: (newLanguageCode) {
                      if (newLanguageCode != null) {
                        languageBloc.add(ChangeLanguageEvent(newLanguageCode));
                        Navigator.pop(context);
                      }
                    },
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
