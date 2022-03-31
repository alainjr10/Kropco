import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kropco/utils/constants.dart';
import 'package:location/location.dart';

import '../components/storage_centers/storage_center_locations.dart';

class StorageCenters extends StatefulWidget {
  static const storageCentersScreenId = "/storage_centers_screen";
  const StorageCenters({Key? key}) : super(key: key);

  @override
  State<StorageCenters> createState() => _StorageCentersState();
}

class _StorageCentersState extends State<StorageCenters> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(25.521563, 22.677433);
  MapType _mapType = MapType.normal;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.getLocation().then((value) {
      debugPrint("Latitude: ${value.latitude}, longitude: ${value.longitude}");
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(value.latitude!, value.longitude!), zoom: 15),
      ));
    });
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Storage Centers"),
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
            markers: StorageCentersMarkerLocations().getmarkers(context, size),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 9.0,
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
