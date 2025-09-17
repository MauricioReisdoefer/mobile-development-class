import 'character_model.dart';
import 'info_model.dart';

class CharacterResponse {
  InfoModel info;
  List<Character> characters;

  CharacterResponse({required this.info, required this.characters});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
    info: json["info"],
    characters: List<Character>.from(
        json["characters"].map((x) => Character.fromJson(x))
      ),
  );

}