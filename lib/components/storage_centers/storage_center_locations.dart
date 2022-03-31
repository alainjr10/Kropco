import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kropco/widgets/storage_center_modal.dart';

class StorageCentersMarkerLocations {
  final Set<Marker> markers = {};
  static const LatLng showLocation =
      LatLng(6.0100073, 10.2609083); //location to show in map

  static final Set<Marker> markers2 = {
    getMarker(
      location: showLocation,
      title: "Mushong Center",
      onTap: () => debugPrint("Mushong Center"),
    ),
    getMarker(
      location: const LatLng(6.015, 10.265),
      title: "Agric School Center",
      onTap: () => debugPrint("Agric School Center"),
    ),
    getMarker(
      location: const LatLng(6.018, 10.255),
      title: "Besides HITL Center",
      onTap: () => debugPrint("Besides HITL Center"),
    ),
    getMarker(
      location: const LatLng(6.00, 10.263),
      title: "Mile 10 Center",
      onTap: () {
        Bottom();
        debugPrint("Mile 10 Center");
      },
    ),
    // Marker(
    //   //add first marker
    //   markerId: MarkerId(showLocation.toString()),
    //   position: showLocation, //position of marker
    //   infoWindow: const InfoWindow(
    //     //popup info
    //     title: 'Mushong Center ',
    //     // snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ),
    // Marker(
    //   //add second marker
    //   markerId: MarkerId(showLocation.toString()),
    //   position: const LatLng(6.015, 10.265), //position of marker
    //   infoWindow: const InfoWindow(
    //     //popup info
    //     title: 'Agric School Center ',
    //     //snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ),
    // Marker(
    //   //add third marker
    //   markerId: MarkerId(showLocation.toString()),
    //   position: const LatLng(6.018, 10.255), //position of marker
    //   infoWindow: const InfoWindow(
    //     //popup info
    //     title: 'Besides HITL Center',
    //     //snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ),
    // Marker(
    //   //add fourth marker
    //   markerId: MarkerId(showLocation.toString()),
    //   position: const LatLng(6.00, 10.263), //position of marker
    //   infoWindow: const InfoWindow(
    //     //popup info
    //     title: 'Mile 10 Center',
    //     //snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ),
  };

  Set<Marker> getmarkers(BuildContext context, Size size) {
    //markers to place on map

    markers.add(
      getMarker(
        location: showLocation,
        title: "Mushong Center",
        onTap: () {
          debugPrint("Mushong Center");
          storageCenterModal(context, "Mushong Center", size);
        },
      ),
    );

    markers.add(
      getMarker(
        location: const LatLng(6.015, 10.265),
        title: "Agric School Center",
        onTap: () {
          debugPrint("Agric School Center");
        },
      ),
    );

    // markers.add(
    //   Marker(
    //     //add third marker
    //     markerId: MarkerId(showLocation.toString()),
    //     position: LatLng(6.018, 10.255), //position of marker
    //     infoWindow: InfoWindow(
    //       //popup info
    //       title: 'Marker Title Third ',
    //       snippet: 'My Custom Subtitle',
    //     ),
    //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    //   ),
    // );

    // markers.add(
    //   Marker(
    //     //add fourth marker
    //     markerId: MarkerId(showLocation.toString()),
    //     position: LatLng(6.00, 10.263), //position of marker
    //     infoWindow: InfoWindow(
    //       //popup info
    //       title: 'Marker Title Fourth ',
    //       snippet: 'My Custom Subtitle',
    //     ),
    //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    //   ),
    // );

    //add more markers here

    return markers;
  }
}

Marker getMarker(
    {required LatLng location,
    required String title,
    required Function() onTap}) {
  return Marker(
    markerId: MarkerId(location.toString()),
    position: location,
    infoWindow: InfoWindow(
      title: title,
      //snippet: 'My Custom Subtitle',
    ),
    icon: BitmapDescriptor.defaultMarker,
    onTap: onTap,
  );
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        //  Do what you wanna do when the bottom sheet closes.
      },
      builder: (context) {
        return Text("");
        // should return a widget
      },
    );
  }
}
