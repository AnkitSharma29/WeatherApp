import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherdataapp/custome/bottomappbar.dart';
import 'package:weatherdataapp/screen/location.dart';

class WeatherHome extends StatefulWidget {
  final String city;
  WeatherHome(this.city);
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  var data;
  var onetemp;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(
        "https://api.openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=b14425a6554d189a2d7dc18a8e7d7263");

    var oneweather = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=${widget.city}&units=metric&appid=b14425a6554d189a2d7dc18a8e7d7263");
    print(res.body);
    data = jsonDecode(res.body);
    onetemp = jsonDecode(oneweather.body);
    setState(() {});
  }

  dataBody(BuildContext context) {
    // var imgurl = data["list"]["weather"][1]["icon"];

    var body = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LocationPage()));
        },

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, 
              boxShadow: [
                BoxShadow(
                offset:Offset(8,10),
                blurRadius: 50,
                color: Colors.black 
              )
              ],
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search city",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        // child: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        //   decoration: BoxDecoration(
        //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('Search city '),
        //       Icon(
        //         Icons.search,
        //       ),
        //     ],
        //   ),
        // )),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("${onetemp["name"]} ,${onetemp["sys"]["country"]} ",
                      style: new TextStyle(color: Colors.white)),
                  Text("${onetemp["weather"][0]["main"]}",
                      style:
                          new TextStyle(color: Colors.white, fontSize: 30.0)),
                  Image.network(
                      "https://openweathermap.org/img/w/${onetemp["weather"][0]["icon"]}.png"),
                  Text("${onetemp["main"]["temp"]}°C",
                      style: new TextStyle(color: Colors.white)),
                  // Text("min :${onetemp["main"]["temp_min"]}°C",
                  //     style:
                  //         new TextStyle(color: Colors.white, fontSize: 20.0)),
                  // Text("max: ${onetemp["main"]["temp_max"]}°C",
                  //     style:
                  //         new TextStyle(color: Colors.white, fontSize: 20.0)),

                  Text("Air speed :${onetemp["wind"]["speed"]}",
                      style:
                          new TextStyle(color: Colors.white, fontSize: 25.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: new Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () => null,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200.0,
            child: ListView.builder(
                itemCount: data["list"].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Day of 5 Cloud",
                                style: new TextStyle(color: Colors.black)),
                            Text(
                                "${data["city"]["name"]} , ${data["city"]["country"]}",
                                style: new TextStyle(color: Colors.black)),
                            Text("${data["list"][index]["weather"][0]["main"]}",
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 24.0)),
                            Text("${data["list"][index]["main"]["temp"]}°C",
                                style: new TextStyle(color: Colors.black)),
                            Image.network(
                                "https://openweathermap.org/img/w/${data["list"][index]["weather"][0]["icon"]}.png"),
                            Text("${data["list"][index]["dt_txt"]}",
                                style: new TextStyle(color: Colors.black)),
                            Text(
                                "${data["list"][index]["weather"][0]["description"]}",
                                style: new TextStyle(color: Colors.black)),
                            Text("${data["cnt"]}",
                                style: new TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      )
    ]));
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //blueGrey
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: onetemp != null
          ? dataBody(context)
          : Center(
              child: CircularProgressIndicator(),
            ),
        
      bottomNavigationBar: BottomTab(),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.refresh,
          color: Colors.green,
        ),
        onPressed: () => print("Refresh"),
      ),
    );
  }
}
