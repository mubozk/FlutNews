import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GeolocationApp(),
    );
  }
}

class GeolocationApp extends StatefulWidget {
  const GeolocationApp({super.key});

  @override
  State<GeolocationApp> createState() => _GeolocationAppState();
}

class _GeolocationAppState extends State<GeolocationApp> {

Position? _currentLocation;
    late bool servicePermission = false;
    late LocationPermission permission;

    String _currentAddress = '';

    Future<Position> _getCurrentLocation() async {
      servicePermission = await Geolocator.isLocationServiceEnabled();
      if(!servicePermission){
        print('Service disabled.');
      }
      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
      }
      return await Geolocator.getCurrentPosition();
    }

    _getAddressfromCoordinates() async{
      try{
        List<Placemark> placemarks = await placemarkFromCoordinates(_currentLocation!.latitude, _currentLocation!.longitude);

        Placemark place = placemarks[0];

        setState(() {
          _currentAddress = '${place.locality}, ${place.country}';
        });
      } catch (e) {
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Location Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Text('Latitude = ${_currentLocation!.latitude} ; Longitude = ${_currentLocation!.longitude}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6,
        ),
        const Text('Coordinates'),
        const SizedBox(height: 30.0,
        ),
        const Text('Location Address', 
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 6,
        ),
        Text('${_currentAddress}'),
        const SizedBox(height: 50.0,
        ),
        ElevatedButton(onPressed: () async {
          setState(() async {
            _currentLocation = await _getCurrentLocation();
            await _getAddressfromCoordinates();
            print('${_currentLocation}');
            print('${_currentAddress}');
          });
        }, 
        child: const Text('Get Location'))
      ],
      ),),
    );
  }
}