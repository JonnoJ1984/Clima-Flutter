import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

import '../location.dart';

const apiKey = '65e672ac5e948a813e510a84ed64df01';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkingHelper networkingHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkingHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
