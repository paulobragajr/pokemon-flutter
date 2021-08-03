import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_flutter/model/Pokemon.dart';
import 'package:pokemon_flutter/model/PokemonApi.dart';
import 'package:pokemon_flutter/page/pokemonlist/PokemonListService.dart';
import 'package:pokemon_flutter/page/pokemonlist/widgets/PokemonItem.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(12),
          addAutomaticKeepAlives: true,
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final pokemonItem = pokemonList[index];
            return PokemonItem(
              index: index,
              pokemon: pokemonItem,
            );
          },
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        )
      ),
    );
  }
}
