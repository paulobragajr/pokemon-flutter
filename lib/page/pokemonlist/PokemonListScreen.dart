import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_flutter/model/Pokemon.dart';
import 'package:pokemon_flutter/model/PokemonApi.dart';
import 'package:pokemon_flutter/page/pokemonlist/PokemonListService.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreen createState() => _PokemonListScreen();
}

class _PokemonListScreen extends State<PokemonListScreen> {
  PokemonListService service = new PokemonListService();
  var pokemonList = <Pokemon>[];

  /*onCreate*/
  @override
  void initState() {
    super.initState();
    this.getPokemon();
  }

  Future getPokemon() async {
    this
        .service
        .GET_POKEMON_LIST()
        .then((response) => response.body)
        .then((response) => {
          setState(() {
            var list = PokemonApi.fromJson(json.decode(response));
              pokemonList = list.pokemon;
          })
        });
  }

  Widget column(pokemonItem) => Expanded(
        child: Column(
          // align the text to the left instead of centered
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemonItem.num}.png'),

            Text(
              pokemonItem.name,
              style: TextStyle(fontSize: 16),
            ),
            Text('subtitle'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemonItem = pokemonList[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[column(pokemonItem)],
              ),
            ),
          );
        },
      )),
    );
  }
}
