import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';
import 'package:mobile_dev_class/widgets/characters.dart';
import 'package:mobile_dev_class/widgets/appbar.dart';
import 'package:http/http.dart' as http;

int current_page = 1;

// https://rickandmortyapi.com/api/character

class TelaPersonagens extends StatefulWidget {
  @override
  State<TelaPersonagens> createState() => _TelaPersonagensState();
}

class _TelaPersonagensState extends State<TelaPersonagens> {
  List<Character> characters = [];

  Future<void> getPageData() async {
    
      final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character?page=${current_page}"));

      if(response.statusCode != 200)
      {
        throw new Exception("Falha ao carregar os dados");
      }

      final body_decoded = jsonDecode(response.body);
      final results = body_decoded["results"];
      if(results != null)
      {
        for (final result in results)
        {
          characters.add(new Character.fromJson(result));
        };
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RickAppBar(),
          body: FutureBuilder(
            future: getPageData(), 
            builder:(context, snapshot) {
              if(1 == 1){
                return 
                CharactersList(
                  charList: characters
                );
            } else {
              return Text("Vazio");
            }
          },
        ),
        bottomNavigationBar: 
        BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    if(current_page >=2){
                      current_page -= 1;
                    }
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPersonagens()),
                  );
                },
              ),
              Text("Page ${current_page}"),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    if(current_page <=41){
                      current_page += 1;
                    }
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPersonagens()),
                  );
                },
              ),
            ],
          ),
        )

    );
  }
}