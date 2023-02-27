import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

class MapsLost extends StatefulWidget {
  const MapsLost({super.key});

  @override
  State<MapsLost> createState() => _MapsLostState();
}

class _MapsLostState extends State<MapsLost> {

  late GoogleMapController controller;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Uint8List? markerImage;

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
    final Uint8List markerIcon = await getBytesFromAssets('images/logo_paw.png', 100);
    FirebaseFirestore.instance.collection('maps_lost').get().then((docData) {
      if (docData.docs.isNotEmpty) {
        for (int i = 0; i < docData.docs.length; ++i) {
          initMarker(docData.docs[i].data(), docData.docs[i].id);
        }
      }
    });
  }

  // sTYLE MARKER
  Future<Uint8List> getBytesFromAssets(String path, int width) async{
    ByteData data = await  rootBundle.load(path);
    ui.Codec codec = await
    ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth:
    width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(), "images/logo_paw.png").then(
        (icon) {
          setState(() {
            markerIcon = icon;
          });
        }
      );
  }

  void initState() {
    getMarkerdata();
    addCustomIcon();
    super.initState();
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
