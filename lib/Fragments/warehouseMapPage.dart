
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wfp/Fragments/shelterupdatePage.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class warehouseMapPage extends StatefulWidget {
  static const String routeName = '/warehouseMapPage';
  warehouseMapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<warehouseMapPage> {
  Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  Position position = null;
  LatLng latLng = null;
  //static const LatLng _center = const LatLng(45.521563, -122.677433);
  void requestLocationPermission(BuildContext context) async {
    //GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = currentPosition;
      latLng = LatLng(position.latitude,position.longitude);

      //debugPrint(geolocationStatus.toString());
    });
  }
  static const LatLng _center = const LatLng(22.139761449969, 90.2808380126953);
  static const LatLng _center1 = const LatLng(22.2630946700057, 90.0556182861328);
  static const LatLng _center2 = const LatLng(22.1861582180894, 90.2080535888672);
  static const LatLng _center3 = const LatLng(22.4078793571418, 90.1606750488281);

  static MarkerId markerId0 = MarkerId("0");
  static MarkerId markerId1 = MarkerId("1");
  static MarkerId markerId2 = MarkerId("2");
  static MarkerId markerId3 = MarkerId("3");

  final Set<Marker> _markers = {
    Marker(
        markerId: markerId0,
        position: _center,
        infoWindow: InfoWindow(
          title: 'Amtoli Warehouse',
          snippet: 'Amtoli',
        )

    ),

    Marker(
        markerId: markerId1,
        position: _center1,
        infoWindow: InfoWindow(
          title: 'Bamna Warehouse',
          snippet: 'Bamna',
        )

    ),

    Marker(
        markerId: markerId2,
        position: _center2,
        infoWindow: InfoWindow(
          title: 'BarguSadar Warehouse',
          snippet: 'BarguSadar',
        )

    ),

    Marker(
        markerId: markerId3,
        position: _center3,
        infoWindow: InfoWindow(
          title: 'Betagi Warehouse',
          snippet: 'Betagi',
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

    requestLocationPermission(context);

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Warehouse Map'),
      ),

      drawer: navigationDrawer(),

      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          //target: latLng != null ? latLng : _center,
          target: latLng,
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