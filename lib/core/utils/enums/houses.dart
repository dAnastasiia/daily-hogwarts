import 'package:flutter/material.dart';

enum Houses {
  gryffindor("gryffindor", Colors.redAccent),
  slytherin("slytherin", Colors.green),
  ravenclaw("ravenclaw", Colors.blueAccent),
  hufflepuff("hufflepuff", Colors.amberAccent);

  final String name;
  final Color color;

  const Houses(this.name, this.color);
}
