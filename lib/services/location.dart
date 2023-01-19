import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double lonitude;
  Future<void> getlocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      lonitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}