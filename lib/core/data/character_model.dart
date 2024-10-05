class Character {
  final String id;
  final String name;
  final List<dynamic> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final Wand wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final List<dynamic> alternateActors;
  final bool alive;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> data) {
    return Character(
      id: data['id'],
      name: data['name'],
      alternateNames: List.castFrom<dynamic, dynamic>(data['alternate_names']),
      species: data['species'],
      gender: data['gender'],
      house: data['house'],
      dateOfBirth: data['dateOfBirth'],
      yearOfBirth: data['yearOfBirth'],
      wizard: data['wizard'],
      ancestry: data['ancestry'],
      eyeColour: data['eyeColour'],
      hairColour: data['hairColour'],
      wand: Wand.fromJson(data['wand']),
      patronus: data['patronus'],
      hogwartsStudent: data['hogwartsStudent'],
      hogwartsStaff: data['hogwartsStaff'],
      actor: data['actor'],
      alternateActors:
          List.castFrom<dynamic, dynamic>(data['alternate_actors']),
      alive: data['alive'],
      image: data['image'],
    );
  }
}

class Wand {
  final String wood;
  final String core;
  final num? length;

  Wand({
    required this.wood,
    required this.core,
    this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> data) {
    return Wand(
      wood: data['wood'],
      core: data['core'],
      length: data['length'],
    );
  }
}
