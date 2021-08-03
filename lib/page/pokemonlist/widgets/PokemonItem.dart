import 'package:flutter/material.dart';
import 'package:pokemon_flutter/const/ConstsApp.dart';
import 'package:pokemon_flutter/model/Pokemon.dart';

class PokemonItem extends StatelessWidget {
  final int index;
  final Pokemon pokemon;

  const PokemonItem({Key? key, required this.index, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  child: Opacity(
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                      height: 80,
                      width: 80,
                    ),
                    opacity: 0.2,
                  ),
                  tag: pokemon.name + 'roatation',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: pokemon.name,
                  child: Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemon.num}.png',
                    alignment: Alignment.bottomRight,
                    height: 80,
                    width: 80
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ConstsApp.getColorType(type: pokemon.type[0])!.withOpacity(0.7),
                ConstsApp.getColorType(type: pokemon.type[0])!
              ],),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
