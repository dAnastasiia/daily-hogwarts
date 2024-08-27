class Spell {
  String id;
  String name;
  String description;

  Spell({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
