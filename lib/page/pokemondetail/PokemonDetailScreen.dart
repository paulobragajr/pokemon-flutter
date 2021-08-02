import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);
  
  @override
  _PokemonDetailScreen createState() => _PokemonDetailScreen();
}

class _PokemonDetailScreen extends State<PokemonDetailScreen> {

var arr = ['a', 'b', 'c', 'd', 'e'];

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
                  style: TextStyle(color: Colors.white, fontSize: 22));
            }),
      ),
    );
  }
}
