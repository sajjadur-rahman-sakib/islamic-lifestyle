import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Marker> markers;
  final Function(GoogleMapController) onMapCreated;

  const GoogleMapsWidget({
    super.key,
    required this.initialLocation,
    required this.markers,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 15,
      ),
      onMapCreated: onMapCreated,
      markers: markers,
    );
  }
}
