
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
  List<String> inputsValue = new List<String>();

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
      for(int i=0;i<10;i++){
        inputs.add(false);
        inputsValue.add("Union$i");
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
          child: Text(company.name, style: TextStyle(fontSize: 20.0),),
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
        //body: Container(
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
                        Expanded(
                          //height: 150.0,
                          child:GridView.builder(
                              //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:5.5),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 5.0),
                              ),

                              itemCount: inputs.length,
                              itemBuilder: (BuildContext context, int index){
                                return new Card(
                                  child: new Container(
                                    padding: new EdgeInsets.all(2.0),
                                    child: new Column(
                                      children: <Widget>[
                                        new CheckboxListTile(
                                            value: inputs[index],
                                            //title: new Text('item ${index}'),
                                            title: new Text(inputsValue[index]),
                                            controlAffinity: ListTileControlAffinity.leading,
                                            onChanged:(bool val){ItemChange(val, index);}
                                        )
                                      ],
                                    ),
                                  ),
                                );

                              }
                          ),

                      ),

//                      new Expanded(
////                        height: 200.0,
////                        decoration: new BoxDecoration(
////                            color: Colors.black38
////                        ),
//                        child: new MyList(),
//                      ),
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

class User {
  const User(this.name);

  final String name;
}

class DataModel {
  String name,username,userid,email,mobile;

  DataModel(this.name, this.username, this.userid, this.email, this.mobile);

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

//              DataModel dataModel = new DataModel('name', 'username', 'id', 'email', 'mobile');
//              DataModel dataMode2 = new DataModel('sadi2', 'shah2', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode3 = new DataModel('sadi3', 'shah3', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode4 = new DataModel('sadi4', 'shah4', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode5 = new DataModel('sadi5', 'shah5', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode6 = new DataModel('sadi6', 'shah6', '6', 'sadi@mail.com', '01723335972');
//
//              listTitle.add(dataModel);
//              listTitle.add(dataMode2);
//              listTitle.add(dataMode3);
//              listTitle.add(dataMode4);
//              listTitle.add(dataMode5);
//              listTitle.add(dataMode6);
//              listTitle.add(dataMode3);

    var pos = 1;
    for (var i = 0; i < 10; i++) {
      // if(i==0){
//                  DataModel dataModel = new DataModel('name', 'username', 'id', 'email', 'mobile');
//                  listTitle.add(dataModel);
      pos+=i;
      //}else{
      DataModel dataMode2 = new DataModel("Sadi$pos", 'shah$pos', '1', 'sadi@mail.com', '01723335972');
      listTitle.add(dataMode2);

      pos-=i;
      //}
    }


    String name = listTitle.elementAt(3).username;
    debugPrint('name: $name');


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
                    decoration: BoxDecoration(
                      color: const Color(0xff5A6268),
//                          image: DecorationImage(
//                            image: ExactAssetImage('images/flowers.jpeg'),
//                            fit: BoxFit.cover,
//                          ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    width: 300.0,
                    child: new Text(
                        "Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 30
                        )
                    )
                ),

                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5A6268),
//                          image: DecorationImage(
//                            image: ExactAssetImage('images/flowers.jpeg'),
//                            fit: BoxFit.cover,
//                          ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    width: 300.0,
                    child: new Text(
                        "username",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 30
                        )
                    )
                ),

                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5A6268),
//                          image: DecorationImage(
//                            image: ExactAssetImage('images/flowers.jpeg'),
//                            fit: BoxFit.cover,
//                          ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    width: 300.0,
                    child: new Text(
                        "id",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 30
                        )
                    )
                ),

                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5A6268),
//                          image: DecorationImage(
//                            image: ExactAssetImage('images/flowers.jpeg'),
//                            fit: BoxFit.cover,
//                          ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    width: 300.0,
                    child: new Text(
                        "email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 30
                        )
                    )
                ),

                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5A6268),
//                          image: DecorationImage(
//                            image: ExactAssetImage('images/flowers.jpeg'),
//                            fit: BoxFit.cover,
//                          ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    width: 300.0,
                    child: new Text(
                        "Mobile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 30
                        )
                    )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //SizedBox(
                SizedBox(
                  width: 1500.0,
                  height: 200.0,

                  child: ListView.builder(

                    itemCount: listTitle.length,
                    itemBuilder: (BuildContext context, int i) {
                      //log('ipos: $i');
                      //debugPrint('ipos: $i');
                      listRow.clear();

                      listRow.add(listTitle.elementAt(i).name);
                      listRow.add(listTitle.elementAt(i).email);
                      listRow.add(listTitle.elementAt(i).mobile);
                      listRow.add(listTitle.elementAt(i).userid);
                      listRow.add(listTitle.elementAt(i).username);



                      return new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: new List.generate(listRow.length, (int j) {
                          //log('j pos: $j');
                          //debugPrint('jpos: $j');

//                  if(i==0){
//                    return new Container(
//                        decoration: BoxDecoration(
//                          color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                          border: Border.all(
//                            color: Colors.white,
//                            width: 2.0,
//                          ),
//                        ),
//                        width: 300.0,
//                        child: new Text(
//                            listRow.elementAt(j),
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.amberAccent,
//                                fontSize: 30
//                            )
//                        )
//                    );
//
//                  }else{
                          return new Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),

                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),

                            width: 300.0,
                            child: new Text(
                                listRow.elementAt(j),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25
                                )
                            ),

//                      child: new DropdownButton<User>(
//                        hint: new Text("Select a user"),
//                        value: selectedUser,
//                        onChanged: (User newValue) {
//                          setState(() {
//                            selectedUser = newValue;
//                          });
//                        },
//                        items: users.map((User user) {
//                          return new DropdownMenuItem<User>(
//                            value: user,
//                            child: new Text(
//                              user.name,
//                              style: new TextStyle(color: Colors.black),
//                            ),
//                          );
//                        }).toList(),
//                      ),

                          );
                          // }
                        }),
                      );
                    },


                  ),
                )
//              Row(
//
//                children: <Widget>[
//
//                  Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                      width: 300.0,
//                      child: new Text(
//                          "Name",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.amberAccent,
//                              fontSize: 30
//                          )
//                      )
//                  ),
//
//                  Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                      width: 300.0,
//                      child: new Text(
//                          "username",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.amberAccent,
//                              fontSize: 30
//                          )
//                      )
//                  ),
//
//                  Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                      width: 300.0,
//                      child: new Text(
//                          "id",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.amberAccent,
//                              fontSize: 30
//                          )
//                      )
//                  ),
//
//                  Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                      width: 300.0,
//                      child: new Text(
//                          "email",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.amberAccent,
//                              fontSize: 30
//                          )
//                      )
//                  ),
//
//                  Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff5A6268),
////                          image: DecorationImage(
////                            image: ExactAssetImage('images/flowers.jpeg'),
////                            fit: BoxFit.cover,
////                          ),
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//                      width: 300.0,
//                      child: new Text(
//                          "Mobile",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.amberAccent,
//                              fontSize: 30
//                          )
//                      )
//                  ),
//                ],
//              ),
              ],
            )



          ],

        ),


//        child: new SizedBox(
//          width: 1500.0,
//          child: new ListView.builder(
//            itemCount: listTitle.length,
//            itemBuilder: (BuildContext context, int i) {
//              //log('ipos: $i');
//              //debugPrint('ipos: $i');
//              listRow.clear();
//
//              listRow.add(listTitle.elementAt(i).name);
//              listRow.add(listTitle.elementAt(i).email);
//              listRow.add(listTitle.elementAt(i).mobile);
//              listRow.add(listTitle.elementAt(i).userid);
//              listRow.add(listTitle.elementAt(i).username);
//
//
//
//              return new Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: new List.generate(listRow.length, (int j) {
//                  //log('j pos: $j');
//                  //debugPrint('jpos: $j');
//
////                  if(i==0){
////                    return new Container(
////                        decoration: BoxDecoration(
////                          color: const Color(0xff5A6268),
//////                          image: DecorationImage(
//////                            image: ExactAssetImage('images/flowers.jpeg'),
//////                            fit: BoxFit.cover,
//////                          ),
////                          border: Border.all(
////                            color: Colors.white,
////                            width: 2.0,
////                          ),
////                        ),
////                        width: 300.0,
////                        child: new Text(
////                            listRow.elementAt(j),
////                            textAlign: TextAlign.center,
////                            style: TextStyle(
////                                color: Colors.amberAccent,
////                                fontSize: 30
////                            )
////                        )
////                    );
////
////                  }else{
//                    return new Container(
//                      decoration: BoxDecoration(
//                        color: const Color(0xff7c94b6),
//
//                        border: Border.all(
//                          color: Colors.white,
//                          width: 2.0,
//                        ),
//                      ),
//
//                      width: 300.0,
//                          child: new Text(
//                              listRow.elementAt(j),
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.red,
//                                  fontSize: 25
//                              )
//                          ),
//
////                      child: new DropdownButton<User>(
////                        hint: new Text("Select a user"),
////                        value: selectedUser,
////                        onChanged: (User newValue) {
////                          setState(() {
////                            selectedUser = newValue;
////                          });
////                        },
////                        items: users.map((User user) {
////                          return new DropdownMenuItem<User>(
////                            value: user,
////                            child: new Text(
////                              user.name,
////                              style: new TextStyle(color: Colors.black),
////                            ),
////                          );
////                        }).toList(),
////                      ),
//
//                    );
//                 // }
//                }),
//              );
//            },
//          ),
//        ),
      ),
    );
  }
}