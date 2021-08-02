// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:pokedex_youtube/consts/consts_app.dart';
import 'package:pokemon_flutter/const/ConstsApp.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final String num;
  final List<String> types;

  const PokeItem({Key? key, required this.name, required this.index, required this.num, required this.types}) : super(key: key);

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
                  tag: name + 'roatation',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      name,
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
                  tag: name,
                  child: Image.network('https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${num}.png',
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
                ConstsApp.getColorType(type: types[0])!.withOpacity(0.7),
                ConstsApp.getColorType(type: types[0])!
              ],),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
