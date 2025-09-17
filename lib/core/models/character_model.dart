class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.url,
    required this.created
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final String url;
  final String created;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
        url: json["url"],
        created: json["created"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "image": image,
        "url": url,
        "created": created
      };
}

class CharacterLocation {
  CharacterLocation({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      CharacterLocation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class CharacterOrigin {
  CharacterOrigin({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterOrigin.fromJson(Map<String, dynamic> json) =>
      CharacterOrigin(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}