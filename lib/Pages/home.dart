import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpaw_mobile/controllers/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // GET CURRENT LOCATION

  String locationMessage = 'Current location of the user';
  late String lat;
  late String long;


  // AUTHENTICATION

  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';

  @override
  void initState() {
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Helpaw',
                style: TextStyle(
                color: Color.fromRGBO(156, 39, 176, 1),
                fontSize: 35,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(
              height: 50,
              child: Image.asset("images/logo_paw.png"),
              ),
            ],
          ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[100],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nome),
              accountEmail: Text(email)),
              ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> LoginPage()),
                  ),
                dense: true,
                title: Text('Sair'),
                trailing: Icon(Icons.exit_to_app),
              )
          ],
        ),
      ),

      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/maps_lost'),
                      child: Column(
                        children: [
                          Text('Perdi um pet'),
                          SizedBox(height: 10),
                          Icon(Icons.pets)
                        ],
                      )),

                      SizedBox(height: 25.0),

                      ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/maps_found'),
                      child: Column(
                        children: [
                          Text('Encontrei um pet'),
                          SizedBox(height: 10),
                          Icon(Icons.pets)
                        ],
                      )),


                      SizedBox(height: 25.0),
                      Text(locationMessage),
                      SizedBox(height: 25.0),

                      ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(160, 130)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        _getCurrentLocation().then((value) {
                          lat = '${value.latitude}';
                          long = '${value.longitude}';
                          setState(() {
                            locationMessage = 'Latitude: $lat, Longitude: $long';
                          });
                          _liveLocation();
                        });
                      },
                      child: Column(
                        children: [
                          Text('Current location'),
                          SizedBox(height: 10),
                          Icon(Icons.local_activity)
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  getUser() async {
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null){
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }

  // GET CURRENT LOCATION
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(
      locationSettings: locationSettings).listen((Position position) {
        lat = position.latitude.toString();
        long = position.longitude.toString();

        setState(() {
          locationMessage = 'Latitude: $lat, Longitude: $long';
        });
      });
  }


}