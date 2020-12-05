import 'package:flutter/material.dart';
import 'package:weatherdataapp/screen/googlemap.dart';
import 'package:weatherdataapp/screen/location.dart';

class BottomTab extends StatefulWidget {
  BottomTab({Key key}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  // String _selectItem = '';

  
void _onButtonPressed(){
  showModalBottomSheet(
  context: context,
  builder: (context){
    return Container(
        color: Color(0xFF737373),
        height: 180,
        child: Container(
        child: _BuildBottomNavigationMenu(),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
      ),
    );
  });
}

Column _BuildBottomNavigationMenu(){
  return Column(
      children:<Widget> [
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("Location"),
          onTap: () { },
        ),
        ListTile(
          leading: Icon(Icons.map),
          title: Text("Map"),
          onTap: () { },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Staus"),
          onTap: () { },
        )
      ],
    );
}

// void _selectItem(String name){

//   Navigator.pop(context);

//   setState((){

//     _selectItem = name;

//   });
// }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      height: 50.0,
      // alignment: Alignment.center,
      child: BottomAppBar(
        
        child: new Row(
          // alignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage()));
              },
            ),
            new IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 12),
              icon: Icon(Icons.add),
              onPressed: () => _onButtonPressed(),
              iconSize: 50,
            ),
            new IconButton(
              icon: Icon(
                Icons.online_prediction
              ),
              onPressed:  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapLocation()));
              },
            ),
            new IconButton(
              icon: Icon(Icons.location_city),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }



}