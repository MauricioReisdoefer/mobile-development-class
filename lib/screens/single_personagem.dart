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
    body: Container(
      child: FutureBuilder<Character>(
        future: getPageData(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text("Erro: ${asyncSnapshot.error}", style: TextStyle(color: Colors.white)));
          } else if (asyncSnapshot.hasData) {
            final char = asyncSnapshot.data!;
            return Center(
              child: Card(
                elevation: 8,
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          char.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        char.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(),
                      _infoLine("Status", char.status),
                      _infoLine("Espécie", char.species),
                      _infoLine("Gênero", char.gender),
                      _infoLine("Origem", char.origin.name),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Sem dados para exibir", style: TextStyle(color: Colors.white)));
          }
        },
      ),
    ),
  );
}

Widget _infoLine(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    ),
  );
}

}
