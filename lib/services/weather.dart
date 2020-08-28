import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

import 'location.dart';

class WeatherModel {
  String units = '&units=metric';

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

  Future<dynamic> getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        '$kOpenWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey$units');

    return await networkingHelper.getData();

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LocationScreen(
    //     locationWeather: weatherData,
    //   );
    // }));
  }
}
