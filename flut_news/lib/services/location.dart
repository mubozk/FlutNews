import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class Location {
  Future<String> getCurrentCountry(BuildContext context) async {
    await _checkLocationPermission(context);

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String country = placemarks[0].country ?? '';
        return country;
      } else {
        print('No placemarks found');
        return '';
      }
    } catch (e) {
      print('Geolocator error: $e');
      return '';
    }
  }

  Future<void> _checkLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      PermissionStatus status = await Permission.location.request();
      if (status == PermissionStatus.denied) {
        await _showPermissionDeniedDialog(context);
      }
    }
  }

  Future<void> _showPermissionDeniedDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Denied'),
          content: Text(
            'Location permission is required for location-based news. Default location set to United States. Re-enable location support from settings and relaunch the app',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
