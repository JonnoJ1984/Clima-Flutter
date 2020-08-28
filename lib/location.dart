import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  //Position position;

  Location() {
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e + ' -> Position was not determined.');
    }
  }
}

// double temp = weatherData['main']['temp'];
//     //print(temp);
//     int conditionID = weatherData['weather'][0]['id'];
//     //print(conditionID);
//     String cityName = weatherData['name'];
//     //print(cityName);
