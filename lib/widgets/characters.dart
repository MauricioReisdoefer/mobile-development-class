import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';
import 'package:mobile_dev_class/screens/single_personagem.dart';

class CharactersList extends StatelessWidget {
  final List<Character> charList;

  const CharactersList({super.key, required this.charList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: charList.length,
      itemBuilder: (context, index) {
        final character = charList[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white60,
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                character.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              character.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Status: ${character.status}"),
                Text("Espécie: ${character.species}"),
                Text("Gênero: ${character.gender}"),
                Text("Origem: ${character.origin.name}"),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePersonagem(id: character.id)));
            },
          ),
        );
      },
    );
  }
}
