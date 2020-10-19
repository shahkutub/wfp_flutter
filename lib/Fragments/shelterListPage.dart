
import 'package:flutter/material.dart';
import 'package:wfp/Fragments/shelterupdatePage.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:wfp/Model/DataModel.dart';

class shelterListPage extends StatefulWidget {
  static const String routeName = '/shelterListPage';
  shelterListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<shelterListPage> {
  List <DataModel> listTitle = new List();
  List <String> listRow = new List();
  @override
  void initState() {
    // TODO: implement initState

//    for (var i = 1; i <= 10; i++) {
//      DataModel dataMode2 = new DataModel('Satgombuj', '10km', '3', '1200sqf', '5000','20', 'test','');
//      listTitle.add(dataMode2);
//    }

    DataModel dataMode2 = new DataModel('Satgombuj', '10km', '3', '1200sqf', '5000','20', 'Cyclone center','');
    listTitle.add(dataMode2);

    DataModel dataMode3 = new DataModel('amtoli', '15km', '2', '1200sqf', '5000','25', 'Cyclone center','');
    listTitle.add(dataMode3);

    DataModel dataMode4 = new DataModel('bamna', '12km', '3', '1300sqf', '5000','25', 'Flood center','');
    listTitle.add(dataMode4);

    DataModel dataMode5 = new DataModel('Badda', '17km', '3', '1500sqf', '5000','25', 'Flood center','');
    listTitle.add(dataMode5);

    DataModel dataMode6 = new DataModel('Kalibari', '15km', '3', '1200sqf', '5000','25', 'Mujib killa','');
    listTitle.add(dataMode6);

    DataModel dataMode7 = new DataModel('jalkhati', '12km', '2', '1100sqf', '4000','25', 'Mujib killa','');
    listTitle.add(dataMode7);

  }




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;



    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shelter Centers'),
      ),

      drawer: navigationDrawer(),

      body: Column(
        children: <Widget>[

          new Container(

            //child: MyList(),

            child: new SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: new Column(

                children: <Widget>[
                  Row(
                    children: <Widget>[


                      Container(

                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "Union",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "Distance From Upazila",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "No Of Floor",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "Floor Space",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "People Capacity",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "No Of Toilet",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "Type",
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
                              color: Colors.black12,
                              border: Border.all(color: Colors.black12)
                          ),

                          width: 150.0,
                          height: 55,
                          child: new Text(
                              "Action",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              )
                          )
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //SizedBox(
                      SizedBox(
                        width: 1200.0,
                        //height: 270.0,
                        height: height/1.4,

                        child: ListView.builder(

                          itemCount: listTitle.length,
                          itemBuilder: (BuildContext context, int i) {

                            listRow.clear();

                            listRow.add(listTitle.elementAt(i).unionName);
                            listRow.add(listTitle.elementAt(i).DistanceFromUpazila);
                            listRow.add(listTitle.elementAt(i).NoOfFloor);

                            listRow.add(listTitle.elementAt(i).FloorSpace);
                            listRow.add(listTitle.elementAt(i).PeopleCapacity);

                            listRow.add(listTitle.elementAt(i).NoOfToilet);
                            listRow.add(listTitle.elementAt(i).type);
                            listRow.add(listTitle.elementAt(i).action);


                            return new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: new List.generate(listRow.length, (int j) {
                                if(j==0){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).unionName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==1){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).DistanceFromUpazila,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==2){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).NoOfFloor,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==3){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).FloorSpace,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==4){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).PeopleCapacity,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==5){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).NoOfToilet,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==6){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: new Text(
                                        listTitle.elementAt(i).type,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15
                                        )
                                    ),
                                  );
                                }
                                if(j==7){
                                  return new Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12)
                                    ),
                                    height: 55,

                                    width: 150.0,
                                    child: IconButton(
                                      padding: new EdgeInsets.all(0.0),
                                      icon: new Icon(Icons.edit, size: 18.0,color: Colors.red,),
                                      onPressed: (){
                                        DataModel data = null;
                                        setState(() {
                                          data = new DataModel(listTitle.elementAt(i).unionName,
                                              listTitle.elementAt(i).DistanceFromUpazila,listTitle.elementAt(i).type,
                                              listTitle.elementAt(i).type,listTitle.elementAt(i).type,
                                              listTitle.elementAt(i).type,listTitle.elementAt(i).type,
                                              listTitle.elementAt(i).type);
                                        });
                                        

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => shelterUpdatePage(text: 'textToSend')),
                                        );
                                      },
                                    ),

                                  );
                                }

                              }),
                            );
                          },
                        ),
                      )


                    ],
                  ),


                ],

              ),

            ),
          ),
        ],
      ),

    );
  }

}

// class DataModel {
//  String unionName,DistanceFromUpazila,NoOfFloor,FloorSpace,PeopleCapacity,NoOfToilet,type,action;
//
//  DataModel(this.unionName, this.DistanceFromUpazila, this.NoOfFloor, this.FloorSpace,
//      this.PeopleCapacity,this.NoOfToilet,this.type,this.action);
//
//}