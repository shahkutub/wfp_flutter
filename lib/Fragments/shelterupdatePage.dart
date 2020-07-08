
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:geolocator/geolocator.dart';
class shelterUpdatePage extends StatefulWidget {
  static const String routeName = '/contactPage';
  shelterUpdatePage({Key key, this.title}) : super(key: key);
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
      Company(0, 'Shelter center Type'),
      Company(1, 'Cyclone Shelter'),
      Company(2, 'Flood Shelter'),
      Company(3, 'Mijib Killa'),
    ];
  }
}

class _MyHomePageState extends State<shelterUpdatePage> {

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  String _radioValue; //Initial definition of radio button value
  String choice;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  Company _selectedCompany;


  Geolocator _geolocator;
  Position _position;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }

  @override
  void initState() {
    // TODO: implement initState
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    setState(() {
      _radioValue = "yes";
    });

    _geolocator = Geolocator();
    LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    checkPermission();
    //    updateLocation();

    StreamSubscription positionStream = _geolocator.getPositionStream(locationOptions).listen(
            (Position position) {
          _position = position;
        });
    updateLocation();
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        _position = newPosition;
      });
    } catch (e) {
      print('Error: ${e.toString()}');
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



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;



    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Update Shelter Center'),
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

                 width: 250.0,
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
                child: Text('Shelter Center Type',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Distance from upozila',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Contact Person',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Floor Space',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('No of Floor',textAlign: TextAlign.right,),
              ),
              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('People storage capacity',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Toilet facility',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                       Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('No of toilet',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Separate Toilet for Male/Female',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('Ground Floor Toilet',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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
                child: Text('Available Water Supply',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('Valuable Facility',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('Women Space',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('Facilities For Disable',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
                child: Center(

                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'yes',
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
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
                child: Text('Type of use after disaster',textAlign: TextAlign.right,),
              ),

              SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12)
                ),
                height: 55,

                width: 250.0,
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

                width: 250.0,
                child: Center(

                  child:   Text(
                ' ${_position != null ? _position.latitude.toString() : '0'}'
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

                width: 250.0,
                child: Center(

                  child: Text(
                          ' ${_position != null ? _position.longitude.toString() : '0'}'
                  ),
                ),

              )
            ],

          ),
          SizedBox(
            height: 10,
          ),

          Container(
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
                style: TextStyle(fontSize: 20,color: Colors.white,),
                textAlign: TextAlign.center,

              ),
            ),

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

            width: 250.0,
            child: Center(

              child: Text(
                'Update',
                style: TextStyle(fontSize: 25,color: Colors.white,),
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