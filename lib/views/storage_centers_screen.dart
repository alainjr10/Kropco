import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kropco/utils/constants.dart';

class StorageCenters extends StatefulWidget {
  static const storageCentersScreenId = "/storage_centers_screen";
  const StorageCenters({Key? key}) : super(key: key);

  @override
  State<StorageCenters> createState() => _StorageCentersState();
}

class _StorageCentersState extends State<StorageCenters> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  MapType _mapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _toggleMapType() {
    if (_mapType == MapType.normal) {
      setState(() {
        _mapType = MapType.satellite;
      });
    } else if (_mapType == MapType.satellite) {
      setState(() {
        _mapType = MapType.normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google maps"),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: _mapType,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            right: 12.0,
            top: 80.0,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 21.0,
              child: IconButton(
                onPressed: () {
                  _toggleMapType();
                },
                icon: const Icon(
                  Icons.layers_outlined,
                  size: 27.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
