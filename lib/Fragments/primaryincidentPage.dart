
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class primaryincidentPage extends StatefulWidget {
  static const String routeName = '/primaryincidentPage';

  primaryincidentPage() : super();
  @override
  primaryincidentPageState createState() => primaryincidentPageState();

}

class primaryincidentPageState extends State<primaryincidentPage> {
  List<bool> inputs = new List<bool>();
  //List<String> inputsValue = new List<String>();

  List<Union> _unions = Union.getUnions();
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArray = [];

  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;

    });
  }


  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    tmpArray.clear();




    setState(() {
      for(int i=0;i<_unions.length;i++){
        inputs.add(false);
      }
    });

    super.initState();
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

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }



  @override
  Widget build(BuildContext context) {
    //return new Scaffold(

    return new Scaffold(
        appBar: AppBar(
          title: Text("Primary Report of Hazard"),
        ),
        drawer: navigationDrawer(),

        body: Container(
                child: new Column(

                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //Text("Select a company"),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  DropdownButton(
                                    value: _selectedCompany,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  //Text('Selected: ${_selectedCompany.name}'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Center(

                              child: Row(

                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
//                                  Text("${selectedDate.toLocal()}".split(' ')[0]),
////                                  SizedBox(height: 20.0,),
////                                  RaisedButton(
////
////                                    onPressed: () => _selectDate(context),
////                                    child: Text('Select date'),
////                                  ),

                                  FlatButton.icon(
                                    //color: Colors.red,
                                     //`Icon` to display
                                    label: Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontSize: 15.0)), //`Text` to display
                                      icon: Icon(Icons.calendar_today,size: 20),
                                    onPressed: () {
                                      _selectDate(context);
                                    }
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Division:",style: TextStyle(fontSize:17.0,)),
                              Text("Khulna"),
                            ],
                          ),

                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("District:",style: TextStyle(fontSize:17.0)),
                              Text("Bagerhat"),
                            ],
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Upazila:",style: TextStyle(fontSize:17.0 )),
                              Text("Bagerhat Sadar Upazila")
                            ],
                          ),


                        ],
                      ),

                        SizedBox(
                          height: 10,
                        ),

                      Container(
                        
                        height: 60,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: inputs.length,
                            itemBuilder: (BuildContext context, int index) =>
                                //Text('Dummy Card Text')
                            Card(

                              child: Row(

                                children: <Widget>[
                                  Checkbox(
                                      value: inputs[index],
                                      onChanged: (bool val){ItemChange(val, index);}
                                  ),
                                  Padding(padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                    child: Text(_unions[index].name, style:TextStyle(fontSize: 15,)),
                                  ),

                                ],
                              ),


                            ),
                          ),

                      ),
                      SizedBox(
                        height: 10,
                      ),

                      new Expanded(
                        child: new MyList(),
                      ),


                    ],
                )
            )



    );
  }
}


class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0, 'Hazard Type'),
      Company(1, 'Cyclone'),
      Company(2, 'EarthQuake'),
      Company(3, 'Flood'),
      Company(4, 'Fire'),
    ];
  }
}


class Union {
  int id;
  String name;

  Union(this.id, this.name);

  static List<Union> getUnions() {
    return <Union>[
      Union(0, 'Baruipara'),
      Union(1, 'Bemarta'),
      Union(2, 'Bishnupur'),
      Union(3, 'Dema'),
      Union(4, 'Gotapara'),
      Union(5, 'Jatrapur'),
      Union(6, 'Karapara'),
      Union(7, 'Khanpur'),
      Union(8, 'Rakhalgachhi'),
      Union(9, 'Shatgambuj'),
    ];
  }
}

class User {
  const User(this.name);

  final String name;
}

class DataModel {
  String unionName,fullAffectedFamily,partialAffectedFamily,fullAffectedHouse,partialAffectedHouse,dead,injured,shelterCenter,takenShelter,comment;

  DataModel(this.unionName, this.fullAffectedFamily, this.partialAffectedFamily, this.fullAffectedHouse,
      this.partialAffectedHouse,this.dead,this.injured,this.shelterCenter,this.takenShelter,this.comment);

}
class MyList extends StatefulWidget {
  MyList({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyList> {
  @override
  Widget build(BuildContext context) {

    User selectedUser;
    List<User> users = <User>[const User('Foo'), const User('Bar')];

    List <DataModel> listTitle = new List();
    double height = MediaQuery.of(context).size.height;

    var pos = 1;
    for (var i = 0; i < 15; i++) {
      pos+=i;
      DataModel dataMode2 = new DataModel('', '', '', '', '','', '', '', '', '');
      listTitle.add(dataMode2);
      pos-=i;

    }


//    String name = listTitle.elementAt(3).username;
//    debugPrint('name: $name');


    List <String> listRow = new List();

    String dropdownValue = 'One';

    return new Scaffold(
      body: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: new Column(

          children: <Widget>[
            Row(
              children: <Widget>[


                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                  ),

                    width: 300.0,
                    height: 55,
                    child: new Text(
                        "Pourashava/Union",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)
                        ),

                        width: 300.0,
                        height: 30,
                        child: new Text(
                            "No of Family Affected",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            )
                        )
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 25,
                            width: 150.0,
                            child: new Text(
                                "Fully Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 25,
                            width: 150.0,
                            child: new Text(
                                "Partially Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                      ],

                    )

                  ],

                ),

                Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)
                        ),

                        width: 300.0,
                        height: 30,
                        child: new Text(
                            "No of House Affected",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            )
                        )
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 25,
                            width: 150.0,
                            child: new Text(
                                "Fully Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 25,
                            width: 150.0,
                            child: new Text(
                                "Partially Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                      ],

                    )

                  ],

                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 55,
                    width: 300.0,
                    child: new Text(
                        "No. of Deadiv",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 55,
                    width: 300.0,
                    child: new Text(
                        "No. of Injured",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                      height: 55,
                    width: 300.0,
                    child: new Text(
                        "No of Shelter Center",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 55,
                    width: 300.0,
                    child: new Text(
                        "No of People Taken Shelter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 55,
                    width: 300.0,
                    child: new Text(
                        "Comments",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),


              ],
            ),
            Row(
              children: <Widget>[
                //SizedBox(
                SizedBox(
                  width: 2400.0,
                  //height: 270.0,
                  height: height/2.3,

                  child: ListView.builder(

                    itemCount: listTitle.length,
                    itemBuilder: (BuildContext context, int i) {

                      listRow.clear();
                      listRow.add(listTitle.elementAt(i).unionName);
                      listRow.add(listTitle.elementAt(i).fullAffectedFamily);
                      listRow.add(listTitle.elementAt(i).partialAffectedFamily);

                      listRow.add(listTitle.elementAt(i).fullAffectedHouse);
                      listRow.add(listTitle.elementAt(i).partialAffectedHouse);

                      listRow.add(listTitle.elementAt(i).dead);
                      listRow.add(listTitle.elementAt(i).injured);
                      listRow.add(listTitle.elementAt(i).shelterCenter);
                      listRow.add(listTitle.elementAt(i).takenShelter);
                      listRow.add(listTitle.elementAt(i).comment);

                      return new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: new List.generate(listRow.length, (int j) {

                          if(j==1 || j==2 || j==3 || j==4){
                            return new Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12)
                                  ),
                                  height: 55,
                                  width: 150.0,
                                  child: new Text(
                                      listRow.elementAt(j),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 25
                                      )
                                  ),
                                ),
                              ],

                            );
                          }else{
                            return new Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                              ),
                              height: 55,

                              width: 300.0,
                              child: new Text(
                                  listRow.elementAt(j),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 25
                                  )
                              ),
                            );
                          }

                          // }
                        }),
                      );
                    },
                  ),
                )


              ],
            ),
            Row(
              children: <Widget>[


                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),

                    width: 300.0,
                    height: 40,
                    child: new Text(
                        "Pourashava/Union",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        )
                    )
                ),

                Column(
                  children: <Widget>[
//                    Container(
//                        padding: const EdgeInsets.all(3.0),
//                        decoration: BoxDecoration(
//                            border: Border.all(color: Colors.black12)
//                        ),
//
//                        width: 300.0,
//                        height: 30,
//                        child: new Text(
//                            "No of Family Affected",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 20
//                            )
//                        )
//                    ),

                    Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 40,
                            width: 150.0,
                            child: new Text(
                                "Fully Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 40,
                            width: 150.0,
                            child: new Text(
                                "Partially Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                      ],

                    )

                  ],

                ),

                Column(
                  children: <Widget>[
//                    Container(
//                        padding: const EdgeInsets.all(3.0),
//                        decoration: BoxDecoration(
//                            border: Border.all(color: Colors.black12)
//                        ),
//
//                        width: 300.0,
//                        height: 30,
//                        child: new Text(
//                            "No of House Affected",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 20
//                            )
//                        )
//                    ),

                    Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 40,
                            width: 150.0,
                            child: new Text(
                                "Fully Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                        Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)
                            ),
                            height: 40,
                            width: 150.0,
                            child: new Text(
                                "Partially Affected",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                        ),

                      ],

                    )

                  ],

                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 40,
                    width: 300.0,
                    child: new Text(
                        "No. of Deadiv",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 40,
                    width: 300.0,
                    child: new Text(
                        "No. of Injured",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 40,
                    width: 300.0,
                    child: new Text(
                        "No of Shelter Center",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 40,
                    width: 300.0,
                    child: new Text(
                        "No of People Taken Shelter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),

                Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)
                    ),
                    height: 40,
                    width: 300.0,
                    child: new Text(
                        "Comments",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    )
                ),


              ],
            ),

          ],

        ),

      ),
    );
  }


}