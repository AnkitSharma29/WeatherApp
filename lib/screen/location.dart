import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherdataapp/screen/weatherhome.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
    TextEditingController _city = TextEditingController();
  var result;
   var data;

  predictGender(String name) async {
     var res = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$name&units=metric&appid=b14425a6554d189a2d7dc18a8e7d7263");

    print(res.body);
    data = jsonDecode(res.body);
  

    result = "Temp : ${data['main']['temp']}°C";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Enter your city name",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextField(
                controller: _city,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => predictGender(_city.text),
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text("Click"
              ),
            ),

             RaisedButton(
              onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherHome(_city.text)));
              },
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text("City"
              ),
            ),

            if (result != null) Text(result),
          ],
        ),
      ),
      

    );
  }
}