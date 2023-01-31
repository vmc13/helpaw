import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  late GoogleMapController controller;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdValue = specifyId;
    final MarkerId markerId = MarkerId(markerIdValue);
    final Marker marker = Marker(
        markerId: markerId,
        position:
            LatLng(specify['location'].latitude, specify['location'].longitude),
        infoWindow: InfoWindow(title: 'Helpaw', snippet: specify['address']));

    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerdata() async {
    FirebaseFirestore.instance.collection('maps').get().then((docData) {
      if (docData.docs.isNotEmpty) {
        for (int i = 0; i < docData.docs.length; ++i) {
          initMarker(docData.docs[i].data(), docData.docs[i].id);
        }
      }
    });
  }

  // sTYLE MARKER

  void initState() {
    getMarkerdata();
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "images/logo_paw.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId(''),
            position: LatLng(-5.089040807202588, -42.81113574771309),
            icon: markerIcon,
            infoWindow: InfoWindow(title: 'Instituto Federal do Piauí'))
      ].toSet();
    }

    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(-5.089040807202588, -42.81113574771309), zoom: 12.0),
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
