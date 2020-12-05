import 'package:flutter/material.dart';
// import 'package:weatherdataapp/Homeweather.dart';
import 'package:weatherdataapp/screen/weatherhome.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.white,
        fontFamily: "Pacifico",
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherHome("india"),
    );
  }
}
