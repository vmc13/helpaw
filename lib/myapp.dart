import 'package:flutter/material.dart';
import 'package:helpaw_mobile/Pages/home.dart';
import 'package:helpaw_mobile/controllers/cadastro.dart';
import 'package:helpaw_mobile/controllers/login.dart';
import 'package:helpaw_mobile/controllers/maps_found.dart';
import 'package:helpaw_mobile/controllers/maps_lost.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Helpaw',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0
        )
      ),
     routes: {
      '/':(context) => LoginPage(),
      '/cadastro': (context) => SignUp(),
      '/home':(context) => Home(),
      '/maps_lost':(context) => MapsLost(),
      '/maps_found':(context) => MapsFound(),
     },
    );
  }
}
