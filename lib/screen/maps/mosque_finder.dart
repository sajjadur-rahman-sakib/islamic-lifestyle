import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakib/screen/maps/google_maps.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class MosqueFinder extends StatefulWidget {
  const MosqueFinder({super.key});

  @override
  State<MosqueFinder> createState() => _MosqueFinderState();
}

class _MosqueFinderState extends State<MosqueFinder> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  LatLng _initialLocation = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _setInitialLocation();
  }

  Future<void> _setInitialLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialLocation = LatLng(position.latitude, position.longitude);
    });

    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _initialLocation,
          zoom: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar("Mosque Finder"),
      body: Stack(
        children: [
          GoogleMapsWidget(
            initialLocation: _initialLocation,
            markers: _markers,
            onMapCreated: (controller) {
              _mapController = controller;
              _mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _initialLocation,
                    zoom: 14,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _searchMosques,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.functionalButtonColor,
                ),
                child: const Text(
                  'Search Nearby Mosques',
                  style: TextStyle(
                    color: AppColors.textDefaultColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _searchMosques() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);

    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 14,
        ),
      ),
    );

    String googleMapsApiKey = 'AIzaSyDFQ3pm9BAlkTJiE2AU1UDpG5ao2PJk0hc';
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${currentLocation.latitude},${currentLocation.longitude}&radius=1500&type=mosque&key=$googleMapsApiKey';

    final response = await http.get(Uri.parse(url));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = jsonResponse['results'];

      setState(
        () {
          _markers.clear();
          for (var result in results) {
            final marker = Marker(
              markerId: MarkerId(result['place_id']),
              position: LatLng(
                result['geometry']['location']['lat'],
                result['geometry']['location']['lng'],
              ),
              infoWindow: InfoWindow(
                title: result['name'],
                snippet: result['vicinity'],
              ),
            );
            _markers.add(marker);
          }
        },
      );
    }
  }
}
