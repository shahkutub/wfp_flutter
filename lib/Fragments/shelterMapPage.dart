
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wfp/Fragments/shelterupdatePage.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class shelterMapPage extends StatefulWidget {
  static const String routeName = '/shelterMapPage';
  shelterMapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<shelterMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(23.2306433, 90.9486223);
  static const LatLng _center1 = const LatLng(22.1400218212491, 90.1283837911898);
  static const LatLng _center2 = const LatLng(22.970713831629, 90.1637154737501);
  static const LatLng _center3 = const LatLng(22.679717856357, 90.2128246207327);

  static MarkerId markerId0 = MarkerId("0");
  static MarkerId markerId1 = MarkerId("1");
  static MarkerId markerId2 = MarkerId("2");
  static MarkerId markerId3 = MarkerId("3");

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  //static const LatLng _center = const LatLng(45.521563, -122.677433);



  final Set<Marker> _markers = {
    Marker(
        markerId: markerId0,
        position: _center,
        infoWindow: InfoWindow(
          title: 'Mujib killa',
          snippet: 'Kalibari',
        )

    ),

    Marker(
        markerId: markerId1,
        position: _center1,
        infoWindow: InfoWindow(
          title: 'Barishal Babahan',
          snippet: 'Barishal Babahan',
        )

    ),

    Marker(
        markerId: markerId2,
        position: _center2,
        infoWindow: InfoWindow(
          title: 'Algaalilzhara Baban',
          snippet: 'Algaalilzhara Baban',
        )

    ),

    Marker(
        markerId: markerId3,
        position: _center3,
        infoWindow: InfoWindow(
          title: 'basandd acenter',
          snippet: 'basandd acenter',
        )

    ),
  };

  @override
  void initState() {
    // TODO: implement initState

  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;



    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shelter Map'),
      ),

      drawer: navigationDrawer(),

      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }

}

class DataModel {
  String unionName,DistanceFromUpazila,NoOfFloor,FloorSpace,PeopleCapacity,NoOfToilet,type,action;

  DataModel(this.unionName, this.DistanceFromUpazila, this.NoOfFloor, this.FloorSpace,
      this.PeopleCapacity,this.NoOfToilet,this.type,this.action);

}