import 'package:daily_hogwarts/core/models/spell_model.dart';
import 'package:daily_hogwarts/core/utils/mock_spells.dart' as mock;
import 'package:flutter/material.dart';

class SpellsViewModel with ChangeNotifier {
  List<Spell> _spells = [...mock.spells];
  int _currentIndex = 0;

  List<Spell> get spells => _spells;
  Spell get spell => _spells[_currentIndex];

  void fetchSpells() {
    _spells = [...mock.spells]; // * It should be replaced with an API call
    _currentIndex = 0;

    notifyListeners();
  }

  void removeSpell() {
    if (_spells.isNotEmpty) {
      _spells.removeAt(_currentIndex);
      _currentIndex = 0;

      notifyListeners();
    }
  }

  void castSpell() {
    if (_spells.isNotEmpty) {
      _currentIndex = (_currentIndex + 1) % _spells.length;

      notifyListeners();
    }
  }
}
