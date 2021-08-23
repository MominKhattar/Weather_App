import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
       return jsonDecode(data);
      // double temp = decodedata['main']['temp'];
      // int condition = decodedata['weather'][0]['id'];
      // String cityName = decodedata['name'];
    } else {
      print(response.statusCode);
    }
  }
}
