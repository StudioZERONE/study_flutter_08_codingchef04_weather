import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String urlAir;

  Network(
    this.url,
    this.urlAir,
  );

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      //print('--------- parsingData : $parsingData');

      return parsingData;
    } else {
      print('-- getJsonAir(): $response.statusCode');
    }
  }

  Future<dynamic> getJsonDataAir() async {
    http.Response response = await http.get(Uri.parse(urlAir));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      //print('--------- parsingData : $parsingData');

      return parsingData;
    } else {
      print('-- getJsonDataAir(): $response.statusCode');
    }
  }
}
