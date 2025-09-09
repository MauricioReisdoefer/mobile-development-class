import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';

class CharactersList extends StatelessWidget {
  final List<Character> charList;

  CharactersList({required this.charList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: charList.length,
      itemBuilder: (context, index) {
        final character = charList[index];
        return ListTile(
          title: Text(character.name),
          subtitle: Text(character.gender),
        );
      },
    );
  }
}
