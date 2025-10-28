import 'package:flutter/material.dart';
import 'package:hsr_characters_flutter/widgets/tarjeta.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Tarjeta(nombre: "mafuyu1", estrellas: 5),
        Tarjeta(nombre: "mafuyu2", estrellas: 4),
        Tarjeta(nombre: "mafuyu3", estrellas: 3),
        Tarjeta(nombre: "mafuyu4", estrellas: 2),
      ],
    );
  }
}
