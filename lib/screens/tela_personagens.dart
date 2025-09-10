import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';
import 'package:mobile_dev_class/widgets/characters.dart';
import 'package:mobile_dev_class/widgets/appbar.dart';

class TelaPersonagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: RickAppBar(),
        body: CharactersList(
          charList: [Character(id: 0, name: "Rick Sanchez C-137", status: "Alive", species: "Human", type: "", gender: "Male")],
        ),
    );
  }
  
}