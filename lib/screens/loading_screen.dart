import 'dart:convert';

import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apikey = '468d5be0c365a35424971c41fb2dba8f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitue;
  double? longitute;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    latitue = location.latitude;
    longitute = location.longitude;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitue&lon=$longitute&appid=$apikey'));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);

      double temp = decodedata['main']['temp'];
      int condition = decodedata['weather'][0]['id'];
      String cityName = decodedata['name'];

      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
