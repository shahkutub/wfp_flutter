
import 'dart:async';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:wfp/pages/home_page.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wfp/pages/take_picture_page.dart';

class wareHouseUpdatePage extends StatefulWidget {
  static const String routeName = '/contactPage';
  wareHouseUpdatePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0, 'Govt.'),
      Company(1, 'NGO'),

    ];
  }
}

class _MyHomePageState extends State<wareHouseUpdatePage> {

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  String _radioValue; //Initial definition of radio button value
  String _radioValue_toilet; //Initial definition of radio button value
  String _radioValue_toilet_men_women; //Initial definition of radio button value
  String _radioValue_available_water_suply; //Initial definition of radio button value
  String _radioValue_valuable_facility; //Initial definition of radio button value
  String _radioValue_women_space; //Initial definition of radio button value
  String _radioValue_disable_facility; //Initial definition of radio button value
  String choice;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  Company _selectedCompany;

  Position position = null;

  //static LatLng latLng;
  void requestLocationPermission(BuildContext context) async {
    //GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = currentPosition;
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
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;


    setState(() {
      _radioValue = "";
      _radioValue_toilet = "";
      _radioValue_toilet_men_women = "";
      _radioValue_available_water_suply = "";
      _radioValue_valuable_facility = "";
      _radioValue_women_space = "";
      _radioValue_disable_facility = "";

    });
    //_gpsService();
    //getLocation();
  }


  Future<void> getLocation() async {
    debugPrint('denied');
    PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
    if (permission != PermissionStatus.granted) {
      PermissionStatus permission = await LocationPermissions().requestPermissions();
    }

    var geolocator = Geolocator();
    GeolocationStatus geolocationStatus =
    await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        print('denied');
        break;
      case GeolocationStatus.disabled:
      case GeolocationStatus.restricted:
        print('restricted');
        break;
      case GeolocationStatus.unknown:
        print('unknown');
        break;
      case GeolocationStatus.granted:
        await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then((Position _position) {
          if (_position != null) {
            setState((){
              //latLng = LatLng(_position.latitude, _position.longitude,);
            });
          }
        });
        break;
    }
  }

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'yes':
          choice = value;
          break;
        case 'no':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
  void _handleRadioValueChange_toilet(String value) {
    setState(() {
      _radioValue_toilet = value;
      switch (value) {
        case 'yes':
          choice = value;
          break;
        case 'no':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  void _handleRadioValueChange_radioValue_toilet_men_women(String value) {
    setState(() {
      _radioValue_toilet_men_women = value;
      switch (value) {
        case 'yes':
          choice = value;
          break;
        case 'no':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  void _handleRadioValueChange__radioValue_available_water_suply(String value) {
      setState(() {
        _radioValue_available_water_suply = value;
        switch (value) {
          case 'yes':
            choice = value;
            break;
          case 'no':
            choice = value;
            break;
          default:
            choice = null;
        }
        debugPrint(choice); //Debug the choice in console
      });
    }

  void _handleRadioValueChange__radioValue_valuable_facility(String value) {
        setState(() {
          _radioValue_valuable_facility = value;
          switch (value) {
            case 'yes':
              choice = value;
              break;
            case 'no':
              choice = value;
              break;
            default:
              choice = null;
          }
          debugPrint(choice); //Debug the choice in console
        });
      }

  void _handleRadioValueChange_radioValue_women_space(String value) {
          setState(() {
            _radioValue_women_space = value;
            switch (value) {
              case 'yes':
                choice = value;
                break;
              case 'no':
                choice = value;
                break;
              default:
                choice = null;
            }
            debugPrint(choice); //Debug the choice in console
          });
        }

  void _handleRadioValueChange_radioValue_disable_facility(String value) {
            setState(() {
              _radioValue_disable_facility = value;
              switch (value) {
                case 'yes':
                  choice = value;
                  break;
                case 'no':
                  choice = value;
                  break;
                default:
                  choice = null;
              }
              debugPrint(choice); //Debug the choice in console
            });
          }


  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name, style: TextStyle(fontSize: 18.0),),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }



  String _path = null;

  void _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _path = file.path;
    });

  }

  void _showCamera() async {

    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePicturePage(camera: camera)));

    setState(() {
      _path = result;
    });

  }

  void _showOptions(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showCamera();
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Take a picture from camera")
                ),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library")
                )
              ])
          );
        }
    );

  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    requestLocationPermission(context);
    _gpsService();
    //getLocation();


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Update Warehouse'),
      ),


      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Container(
                 width: 100,
                 child: Text('Name',textAlign: TextAlign.right,),
               ),

               SizedBox(
                 width: 10,
               ),

               Container(
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.black12)
                 ),
                 height: 55,

                 width: 200.0,
                 child: Center(

                   child: TextField(
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       //hintText: 'Enter a search term'
                     ),
                     textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 20),
                     //controller: editController,
                     onChanged: (value) => {
                     },
                   ),
                 ),

               )
             ],

         ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Owner',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: DropdownButton(
                    value: _selectedCompany,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Description',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Ministry',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Address',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Floor Count',textAlign: TextAlign.right,),
              ),
              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Capacity',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Capacity Occupied',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Ministry that owns the warehouse Other logistic Assets ',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Distance from DC Office',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('In charge person name',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('In charge email',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('In charge contact',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hintText: 'Enter a search term'
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    //controller: editController,
                    onChanged: (value) => {
                    },
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Transport Facility',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue_toilet_men_women,
                        onChanged: _handleRadioValueChange_radioValue_toilet_men_women,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No'),
                      SizedBox(
                        width: 10,
                      ),
                      Radio(
                        value: 'no',
                        groupValue: _radioValue_toilet_men_women,
                        onChanged: _handleRadioValueChange_radioValue_toilet_men_women,
                      ),
                    ],

                  ),
                ),

              )
            ],

          ),


          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Cold storage facility',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue_available_water_suply,
                        onChanged: _handleRadioValueChange__radioValue_available_water_suply,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No'),
                      SizedBox(
                        width: 10,
                      ),
                      Radio(
                        value: 'no',
                        groupValue: _radioValue_available_water_suply,
                        onChanged: _handleRadioValueChange__radioValue_available_water_suply,
                      ),
                    ],

                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Road Communication',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue_valuable_facility,
                        onChanged: _handleRadioValueChange__radioValue_valuable_facility,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('No'),
                      SizedBox(
                        width: 10,
                      ),
                      Radio(
                        value: 'no',
                        groupValue: _radioValue_valuable_facility,
                        onChanged: _handleRadioValueChange__radioValue_valuable_facility,
                      ),
                    ],

                  ),
                ),

              )
            ],

          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Latitude',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child:   Text(
                ' ${position != null ? position.latitude.toString() : '0'}'
              ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text('Longitude',textAlign: TextAlign.right,),
              ),
              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 200.0,
                child: Center(

                  child: Text(
                          ' ${position != null ? position.longitude.toString() : '0'}'
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),

          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0),

              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black12),
                borderRadius: _borderRadius,

              ),
              height: 55,

              width: 250.0,
              child: Center(

                child: Text(
                  'Update latitude,longitude from current GPS location',
                  style: TextStyle(fontSize: 15,color: Colors.white,),
                  textAlign: TextAlign.center,

                ),
              ),

            ),
            onTap: () {
              requestLocationPermission(context);
            },
          ),


          SizedBox(
            height: 10,
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: FlatButton(
                  child: Text("Take Picture", style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                  onPressed: () {
                    _showOptions(context);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),

              _path == null ? Image.asset("images/place-holder.png") :
              Image.file(File(_path),height: 200,width: 200,),
            ],

          ),
          SizedBox(
            height: 10,
          ),

          Container(
            margin: EdgeInsets.only(left: 80.0,right: 80.0),

            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black12),
              borderRadius: _borderRadius,

            ),
            height: 55,

            width: 200.0,
            child: Center(

              child: Text(
                'Update',
                style: TextStyle(fontSize: 20,color: Colors.white,),
                textAlign: TextAlign.center,

              ),
            ),

          ),

          SizedBox(
            height: 10,
          ),

        ],
      ),

    );
  }

}

class DataModel {
  String unionName,DistanceFromUpazila,NoOfFloor,FloorSpace,PeopleCapacity,NoOfToilet,type,action;

  DataModel(this.unionName, this.DistanceFromUpazila, this.NoOfFloor, this.FloorSpace,
      this.PeopleCapacity,this.NoOfToilet,this.type,this.action);

}