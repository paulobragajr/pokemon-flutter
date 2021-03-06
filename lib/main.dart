import 'package:flutter/material.dart';
import 'package:pokemon_flutter/page/pokemondetail/PokemonDetailScreen.dart';
import 'package:pokemon_flutter/page/pokemonlist/PokemonListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PokemonListScreen(),
      initialRoute: '/list',
      routes: {
        '/list' : (context) => const PokemonListScreen(),
        '/detail' : (context) => const PokemonDetailScreen()
      },
    );
  }
}