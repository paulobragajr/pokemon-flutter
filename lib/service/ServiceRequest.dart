import 'package:http/http.dart' as http;

class ServiceRequest {
  String url_base = "https://raw.githubusercontent.com";
  String context_api = "/Biuni/PokemonGO-Pokedex";

  get(String urlParams) {
    Uri uriGet = this.getUri(urlParams);
    print('GET - URL Request : ${uriGet}');
    return http.get(uriGet);
  }

  Uri getUri(String url) {
    return Uri.parse(url_base + context_api+url);
  }
}
