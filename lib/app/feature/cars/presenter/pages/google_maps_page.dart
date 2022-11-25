import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  const GoogleMapsPage({required this.latitude, required this.longitude ,Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = <Marker>{};
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Google Maps'),
      ),
      body: GoogleMap( 
        markers: markers,
        initialCameraPosition:CameraPosition(
        target: LatLng(
        widget.latitude,
        widget.longitude,
        ),
        zoom: 11,
        ),
      ),
    );
  }
}