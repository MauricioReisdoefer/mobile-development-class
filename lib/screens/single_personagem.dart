import 'package:flutter/material.dart';
import 'package:mobile_dev_class/core/models/character_model.dart';
import 'package:mobile_dev_class/widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SinglePersonagem extends StatefulWidget {
  final int id;

  SinglePersonagem({required this.id});

  @override
  State<SinglePersonagem> createState() => _SinglePersonagemState(id: id);
}

class _SinglePersonagemState extends State<SinglePersonagem> {
  final int id;

  _SinglePersonagemState({required this.id});

  Future<Character> getPageData() async {
    final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character/$id"));

    if (response.statusCode != 200) {
      throw Exception("Falha ao carregar os dados");
    }

    final bodyDecoded = jsonDecode(response.body);
    if (bodyDecoded != null) {
      return Character.fromJson(bodyDecoded);
    } else {
      throw Exception("Dados não encontrados");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RickAppBar(),
      body: FutureBuilder<Character>(
        future: getPageData(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text("Erro: ${asyncSnapshot.error}"));
          } else if (asyncSnapshot.hasData) {
            final char = asyncSnapshot.data!;
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
                    char.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                title: Text(
                  char.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status: ${char.status}"),
                    Text("Espécie: ${char.species}"),
                    Text("Gênero: ${char.gender}"),
                    Text("Origem: ${char.origin.name}"),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("Sem dados para exibir"));
          }
        },
      ),
    );
  }
}
