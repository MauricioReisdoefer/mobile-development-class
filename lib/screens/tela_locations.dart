import 'package:flutter/material.dart';
import 'package:mobile_dev_class/widgets/appbar.dart';

class TelaLocations extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RickAppBar(),
      body: Text("Tela Locations"),
    );
  }
}