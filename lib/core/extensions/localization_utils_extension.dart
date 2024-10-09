import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationUtilsExtension on AppLocalizations {
  // investigate if there is a more efficient way to do this
  String getDynamicLocalizedString(String key) {
    final Map<String, String> localizedStrings = {
      House.gryffindor.name: gryffindor,
      House.slytherin.name: slytherin,
      House.ravenclaw.name: ravenclaw,
      House.hufflepuff.name: hufflepuff,
    };

    return localizedStrings[key] ?? key;
  }
}
