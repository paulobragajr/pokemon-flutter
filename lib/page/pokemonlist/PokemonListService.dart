import 'package:pokemon_flutter/service/ServiceRequest.dart';

class PokemonListService {
  ServiceRequest service = ServiceRequest();

  GET_POKEMON_LIST() {
    return this.service.get('/master/pokedex.json');
  }
}
