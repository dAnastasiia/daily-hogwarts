import 'package:flutter/material.dart';

enum House {
  gryffindor("gryffindor", Colors.redAccent),
  slytherin("slytherin", Colors.green),
  ravenclaw("ravenclaw", Colors.blueAccent),
  hufflepuff("hufflepuff", Colors.amberAccent);

  final String name;
  final Color color;

  const House(this.name, this.color);

  static House fromString(String houseString) {
    return House.values.firstWhere(
      (house) => house.name == houseString.toLowerCase(),
      orElse: () => House.gryffindor,
    );
  }
}
