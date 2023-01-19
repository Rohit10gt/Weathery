import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathery/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getlocationdata();
  }

  void getlocationdata() async{
    LocationPermission permission = await Geolocator.requestPermission();
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getlocationweather();
    Navigator.push(this.context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
        ),
      ),
    );
  }
}
