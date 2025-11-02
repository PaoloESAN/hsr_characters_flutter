import 'package:flutter/material.dart';
import 'package:hsr_characters_flutter/services/hsrApi.dart';
import 'package:hsr_characters_flutter/widgets/tarjeta.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Character>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters = CallApi().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: _futureCharacters,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No characters found.'));
        }

        final characters = snapshot.data!;
        return ListView.builder(
          itemCount: characters.length - 2,
          itemBuilder: (context, index) {
            return Tarjeta(character: characters[index + 2]);
          },
        );
      },
    );
  }
}
