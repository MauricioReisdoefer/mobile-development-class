import 'package:flutter/material.dart';
import 'package:mobile_dev_class/screens/tela_personagens.dart';
import 'package:mobile_dev_class/screens/tela_episodes.dart';
import 'package:mobile_dev_class/screens/tela_locations.dart';

List<String> images = ["locations.png", "episodes.png", "characters.png"];
List<String> titles = ["Locations", "Episodes", "Characters"];
List<Widget> pages = [TelaLocations(), TelaEpisodes(), TelaPersonagens()];

class TelaInicial extends StatelessWidget{
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
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder:(context, index) {
            return Center(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(bottom: 35.00),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/${images[index]}", height: 150, width: 150),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]))
                    }),
                    SizedBox(height: 10),
                    Text(
                      titles[index],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),),
            );
          },
        )
      ),
    );
  }
}