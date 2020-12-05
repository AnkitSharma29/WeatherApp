import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
var kGoogleApiKey = "AIzaSyDJhmQWIYJuuzh9UKOA4oR7xGR_EpNF05M";

  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: [
          FlatButton(onPressed: ()async{
            Prediction p= await PlacesAutocomplete.show(context: context, apiKey: kGoogleApiKey);
            
            print(p.distanceMeters);
            print(p.id);
            
            print(p.placeId);
            print(p.reference);
            print(p.terms);
         
          },child:Icon(Icons.search)),
            

            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: SizedBox(
                height: 600.0,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController googleMapController) {
                    setState(() {
                      mapController = googleMapController;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                      zoom: 15.0, target: LatLng(21.1458, 79.0882)),
                  mapType: MapType.satellite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}