import 'package:flutter/material.dart';
import 'package:hsr_characters_flutter/services/hsrApi.dart';

class DetallesScreen extends StatelessWidget {
  final Character character;
  const DetallesScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(child: Text('Detalles de ${character.description}')),
    );
  }
}
