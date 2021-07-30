import 'dart:core';
import 'package:pokemon_flutter/model/Pokemon.dart';

class PokemonApi {
  late List<Pokemon> pokemon;

  PokemonApi({required this.pokemon});


  PokemonApi.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      // ignore: deprecated_member_use
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

}
