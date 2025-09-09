import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';
import 'package:mobile_dev_class/widgets/characters.dart';

class TelaPersonagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child:Text("Rick and Morty API Consumer",
          style: TextStyle(color: Colors.white),
          )),
        leading: Icon(Icons.rocket, color: Colors.white), 
        backgroundColor: const Color.fromARGB(255, 0, 53, 100),
        ),
        body: CharactersList(
          charList: [Character(id: 0, name: "Rick Sanchez C-137", status: "Alive", species: "Human", type: "", gender: "Male")],
        ),
    );
  }
  
}