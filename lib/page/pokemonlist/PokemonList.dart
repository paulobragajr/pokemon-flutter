import 'package:flutter/material.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonList createState() => _PokemonList();
}

class _PokemonList extends State<PokemonList> {
  var arr = ['a','b','c','d','e'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView.builder(
            itemCount: arr.length,
            itemBuilder: (context, index) {
              final item = arr[index];
              return Text(item,
                  style: TextStyle(color: Colors.white,
                  fontSize: 22));}),
      ),
    );
  }
}