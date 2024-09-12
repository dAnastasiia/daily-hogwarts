import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationUtilsExtension on AppLocalizations {
  String getDynamicLocalizedString(String key) {
    final Map<String, String> localizedStrings = {
      Houses.gryffindor.name: gryffindor,
      Houses.slytherin.name: slytherin,
      Houses.ravenclaw.name: ravenclaw,
      Houses.hufflepuff.name: hufflepuff,
    };

    return localizedStrings[key] ?? key;
  }
}
