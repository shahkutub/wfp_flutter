
import 'dart:async';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:wfp/Fragments/shelterupdatePage.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
class dashboardMapPage extends StatefulWidget {
  static const String routeName = '/dashboardMapPage';
  dashboardMapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<dashboardMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  Position position = null;
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  LatLng latLng = null;

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




  //static LatLng latLng;
  void requestLocationPermission(BuildContext context) async {
    //GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = currentPosition;
      latLng = LatLng(position.latitude,position.longitude);

      //debugPrint(geolocationStatus.toString());
    });
  }

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get gurrent location"),
                content:const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        //_gpsService();
                      })],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    requestLocationPermission(context);
    _gpsService();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
//    requestLocationPermission(context);
//    _gpsService();


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
      ),

      drawer: navigationDrawer(),

      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: latLng != null ? latLng : _center,
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