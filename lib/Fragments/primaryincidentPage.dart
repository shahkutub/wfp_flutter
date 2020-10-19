
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wfp/navigationDrawer/navigationDrawer.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../SizeConfig.dart';

class primaryincidentPage extends StatefulWidget {
  static const String routeName = '/primaryincidentPage';

  primaryincidentPage() : super();
  @override
  primaryincidentPageState createState() => primaryincidentPageState();

}

class primaryincidentPageState extends State<primaryincidentPage> {
  //List<bool> inputs = new List<bool>();
  //List<String> inputsValue = new List<String>();
  List <DataModel> listTitle = new List();
  List<Union> _unions = Union.getUnions();
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  List<TextEditingController> editControFamilyAfFull = new List();
  List<TextEditingController> editControFamilyAfHalf = new List();
  List<TextEditingController> editControHouseAfFull = new List();
  List<TextEditingController> editControHouseAfHalf = new List();
  List<TextEditingController> editControNumOfDead = new List();
  List<TextEditingController> editControNumOfInjured = new List();
  List<TextEditingController> editControNumOfShelterCenter = new List();
  List<TextEditingController> editControNumOfPeopleInShelterCenter = new List();
  List<TextEditingController> editControComments = new List();
  var tmpArray = [];

  int totalfullAfFamily = 0;
  int totalHalfAfFamily = 0;
  int totalFullAfHouse = 0;
  int totalHalfAfHouse = 0;
  int totalDead = 0;
  int totalInjured = 0;
  int totalShelterCenter = 0;
  int totalInShelterCenter = 0;
  int totalComments = 0;


  void ItemChange(bool val,int index){
    //DataModel dataMode2 = new DataModel();
    setState(() {
      //inputs[index] = val;
      if(val==true){
        _unions[index].isCheck=true;
        String n = _unions[index].name;
        DataModel dataMode2 = new DataModel(n, '', '', '', '','', '', '', '', '');
        listTitle.add(dataMode2);
        editControFamilyAfFull.add(new TextEditingController());
        editControFamilyAfHalf.add(new TextEditingController());
        editControHouseAfFull.add(new TextEditingController());
        editControHouseAfHalf.add(new TextEditingController());
        editControNumOfDead.add(new TextEditingController());
        editControNumOfInjured.add(new TextEditingController());
        editControNumOfShelterCenter.add(new TextEditingController());
        editControNumOfPeopleInShelterCenter.add(new TextEditingController());
        editControComments.add(new TextEditingController());
      }else{
        _unions[index].isCheck=false;
        String n = _unions[index].name;
        for(int i=0;i<listTitle.length;i++){
          if(n==listTitle.elementAt(i).unionName){
            listTitle.removeAt(i);
          }
        }

      }
    });
  }


  void _incrementCounter(int i) {
    setState(() {

       var totalAfFull = editControFamilyAfFull[i].text;

       totalAfFull += totalAfFull;


    });
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    tmpArray.clear();

    setState(() {
      for(int i=0;i<_unions.length;i++){
        //inputs.add(false);
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
          child: Text(company.name, style: TextStyle(fontSize: 15.0),),
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
    SizeConfig().init(context);
    //double height = MediaQuery.of(context).size.height;
    double height = SizeConfig.screenHeight;
    debugPrint('height: ${height.round()/3.7}');

//    var pos = 1;
//    for (var i = 0; i < 15; i++) {
//      pos+=i;
//      DataModel dataMode2 = new DataModel('', '', '', '', '','', '', '', '', '');
//      listTitle.add(dataMode2);
//      pos-=i;
//
//    }


//    String name = listTitle.elementAt(3).username;
//    debugPrint('name: $name');


    List <String> listRow = new List();
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

                      Center(

                        child: SizedBox(
                          height: 50.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Division",style: TextStyle(fontSize:20.0,color:Colors.blue)),
                                  Text("Khulna",style: TextStyle(fontSize:15.0,color:Colors.black)),
                                ],
                              ),
                              SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("District",style: TextStyle(fontSize:20.0,color:Colors.blue)),
                                  Text("Bagerhat",style: TextStyle(fontSize:15.0,color:Colors.black)),
                                ],
                              ),
                              SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Upazila",style: TextStyle(fontSize:20.0,color:Colors.blue )),
                                  Text("Bagerhat Sadar Upazila",style: TextStyle(fontSize:15.0,color:Colors.black ))
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),


                      Text("Union",style: TextStyle(fontSize:20.0,color:Colors.blue )),


                      Container(
                        
                        height: 60,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _unions.length,
                            itemBuilder: (BuildContext context, int index) =>
                                //Text('Dummy Card Text')
                            Card(

                              child: Row(

                                children: <Widget>[
                                  Checkbox(
                                      value: _unions[index].isCheck,
                                      onChanged: (bool val){
                                        //debugPrint('index: $_unions[index].name');

                                        ItemChange(val, index);
                                        //if(val==true){

//                                          setState(() {
//                                            DataModel dataMode2 = new DataModel('', '', '', '', '','', '', '', '', '');
//                                            listTitle.add(dataMode2);
//                                          });
                                        //}
                                      }
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

                      new Container(

                        //child: MyList(),

                        child: new SingleChildScrollView(
                          scrollDirection: Axis.horizontal,

                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child:Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            border: Border.all(color: Colors.black12)
                                        ),

                                        width: 170.0,
                                        height: 55,
                                        child: new Text(
                                            "Pourashava/Union",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15
                                            )
                                        )
                                    ),
                                  ),



                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              border: Border.all(color: Colors.black12)
                                          ),

                                          width: 250.0,
                                          height: 30,
                                          child: new Text(
                                              "No of Family Affected",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15
                                              )
                                          )
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 25,
                                              width: 125.0,
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
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 25,
                                              width: 125.0,
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
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(3.0),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              border: Border.all(color: Colors.black12)
                                          ),

                                          width: 250.0,
                                          height: 30,
                                          child: new Text(
                                              "No of House Affected",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15
                                              )
                                          )
                                      ),

                                      Row(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 25,
                                              width: 125.0,
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
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 25,
                                              width: 125.0,
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
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 100.0,
                                      child: new Text(
                                          "No. of Dead",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 100.0,
                                      child: new Text(
                                          "No. of Injured",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 100.0,
                                      child: new Text(
                                          "No of Shelter Center",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                    alignment:Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 100.0,
                                      child: new Text(
                                          "No of People Taken Shelter",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 250.0,
                                      child: new Text(
                                          "Comments",
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
                                  SizedBox(
                                    width: 1320.0,
                                    //height: 140.0,
                                    height: height.round()/3.7,
                                    //height: SizeConfig.safeBlockVertical * 25,

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


                                            if(j==0){
                                              return new Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 170.0,
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
                                              return new Row(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      keyboardType: TextInputType.number,
                                                      controller: editControFamilyAfFull[i],
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        //for(0)
                                                      totalfullAfFamily += int.parse(editControFamilyAfFull[i].text),
                                                      //debugPrint("total: ${totalfullAfFamily}")
                                                      },

                                                    ),

                                                  ),
                                                ],

                                              );
                                            }
                                            if(j==2){
                                              return new Row(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      keyboardType: TextInputType.number,
                                                      controller: editControFamilyAfHalf[i],
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        totalHalfAfFamily += int.parse(editControFamilyAfHalf[i].text),
                                                      },

                                                    ),

                                                  ),
                                                ],

                                              );
                                            }
                                            if(j==3){
                                              return new Row(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      keyboardType: TextInputType.number,
                                                      controller: editControHouseAfFull[i],
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        totalFullAfHouse += int.parse(editControHouseAfFull[i].text),
                                                      },

                                                    ),

                                                  ),
                                                ],

                                              );
                                            }
                                            if(j==4){
                                              return new Row(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      keyboardType: TextInputType.number,
                                                      controller: editControHouseAfHalf[i],
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        totalHalfAfHouse += int.parse(editControHouseAfHalf[i].text),
                                                      },

                                                    ),

                                                  ),
                                                ],

                                              );
                                            }
                                            if(j==5){
                                              return new Container(
                                                alignment: Alignment.center,
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 100.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    keyboardType: TextInputType.number,
                                                    controller: editControNumOfDead[i],
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      totalDead += int.parse(editControNumOfDead[i].text),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==6){
                                              return new Container(
                                                alignment: Alignment.center,
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 100.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    keyboardType: TextInputType.number,
                                                    controller: editControNumOfInjured[i],
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      totalInjured += int.parse(editControNumOfInjured[i].text),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==7){
                                              return new Container(
                                                alignment: Alignment.center,
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 100.0,
                                                child: Flexible(
                                                  child: TextField(
                                                    keyboardType: TextInputType.number,
                                                    controller: editControNumOfShelterCenter[i],
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      totalShelterCenter += int.parse(editControNumOfShelterCenter[i].text),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==8){
                                              return new Container(
                                                alignment: Alignment.center,
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 100.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    keyboardType: TextInputType.number,
                                                    controller: editControNumOfPeopleInShelterCenter[i],
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      totalInShelterCenter += int.parse(editControNumOfPeopleInShelterCenter[i].text),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==9){
                                              return new Container(
                                                alignment: Alignment.center,
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(
                                                  child: TextField(

                                                    controller: editControComments[i],
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      //totalComments += i),
                                                    },
                                                  ),
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
                              Row(
                                children: <Widget>[


                                  Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),

                                      width: 170.0,
                                      height: 40,
                                      child: new Text(
                                          "Total",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Column(
                                    children: <Widget>[

                                      Row(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  '$totalfullAfFamily',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15
                                                  )
                                              )
                                          ),

                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  '$totalHalfAfFamily',
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
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  '$totalFullAfHouse',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15
                                                  )
                                              )
                                          ),

                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  '$totalHalfAfHouse',
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
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 100.0,
                                      child: new Text(
                                          '$totalDead',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 100.0,
                                      child: new Text(
                                          '$totalInjured',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 100.0,
                                      child: new Text(
                                          '$totalShelterCenter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 100.0,
                                      child: new Text(
                                          '$totalInShelterCenter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          //'${editControComments.length}',
                                          '',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15
                                          )
                                      )
                                  ),


                                ],
                              ),

                            ],

                          ),

                        ),
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
  bool isCheck;

  Union(this.id, this.name, this.isCheck);

  static List<Union> getUnions() {
    return <Union>[
      Union(0, 'Baruipara',false),
      Union(1, 'Bemarta',false),
      Union(2, 'Bishnupur',false),
      Union(3, 'Dema',false),
      Union(4, 'Gotapara',false),
      Union(5, 'Jatrapur',false),
      Union(6, 'Karapara',false),
      Union(7, 'Khanpur',false),
      Union(8, 'Rakhalgachhi',false),
      Union(9, 'Shatgambuj',false),
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
class DataModel1 {
  String name,username,userid,email,mobile;

  DataModel1(this.name, this.username, this.userid, this.email, this.mobile);

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

    List <DataModel1> listTitle = new List();

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
      DataModel1 dataMode2 = new DataModel1("Sadi$pos", 'shah$pos', '1', 'sadi@mail.com', '01723335972');
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
                SizedBox(
                  width: 3000.0,
                  height: 260.0,

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
                      listRow.add(listTitle.elementAt(i).username);
                      listRow.add(listTitle.elementAt(i).username);
                      listRow.add(listTitle.elementAt(i).username);
                      listRow.add(listTitle.elementAt(i).username);
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
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter a search term'
                              ),
                            ),
//                            child: new Text(
//                                listRow.elementAt(j),
//                                textAlign: TextAlign.center,
//                                style: TextStyle(
//                                    color: Colors.red,
//                                    fontSize: 25
//                                )
//                            ),

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
            ),




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

class LocationName extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Division",style: TextStyle(fontSize:20.0,color:Colors.blue)),
              Text("Khulna",style: TextStyle(fontSize:15.0,color:Colors.black)),
            ],
          ),

          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("District",style: TextStyle(fontSize:20.0,color:Colors.blue)),
              Text("Bagerhat",style: TextStyle(fontSize:15.0,color:Colors.black)),
            ],
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Upazila",style: TextStyle(fontSize:20.0,color:Colors.blue )),
              Text("Bagerhat Sadar Upazila",style: TextStyle(fontSize:15.0,color:Colors.black ))
            ],
          ),
        ],
      ),

    );
  }
}