import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CurrentLocation extends GetxController {
  Position? currentLocation;
  bool servicePermission = false;
  late LocationPermission permission;

  String currentCityAddress = "".obs.toString();
  String currentCountryAddress = "".obs.toString();

  Future<Position> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();

    if (!servicePermission) {
      permission = await Geolocator.checkPermission();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return await Geolocator.getCurrentPosition();
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );

      Placemark place = placemarks[0];

      currentCityAddress = place.locality ?? 'Dhaka';
      currentCountryAddress = place.country ?? 'Bangladesh';
    } catch (e) {
      return;
    }
  }

  Stream<Position> getPositionStream() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  void handleLocationUpdates() {
    getPositionStream().listen((Position position) async {
      currentLocation = position;
      await getAddressFromCoordinates();
      debugPrint('Updated location: $currentLocation');
      debugPrint('City: $currentCityAddress, Country: $currentCountryAddress');
    });
  }
}
