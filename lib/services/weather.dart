import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apikey = '468d5be0c365a35424971c41fb2dba8f';

const openWeahterApi = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getloationWeather() async {
    Location location = Location();
    await location.getcurrentlocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeahterApi?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
