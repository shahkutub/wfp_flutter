
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
  List <DataModel> listTitle = new List();
  List<Union> _unions = Union.getUnions();
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  //TextEditingController editControllerAfFull = new TextEditingController();
  TextEditingController editControllerAfHalf = new TextEditingController();
  TextEditingController editControHouseAfFull = new TextEditingController();
  TextEditingController editControHouseAfHalf = new TextEditingController();
  TextEditingController editControDeadDiv = new TextEditingController();
  TextEditingController editControInjured = new TextEditingController();
  TextEditingController editControshelterNum = new TextEditingController();
  TextEditingController editControsPeoplehelterNum = new TextEditingController();

  List<TextEditingController> editControllerAfFull = new List();
  var tmpArray = [];

  int total_family_afected_full;

  int fm_full_aff;

  int family_full_af =0;

  int totalAfFull;

  void ItemChange(bool val,int index){
    //DataModel dataMode2 = new DataModel();
    setState(() {
      inputs[index] = val;
      if(val==true){
        String n = _unions[index].name;
        DataModel dataMode2 = new DataModel(n, '', '', '', '','', '', '', '', '');

        listTitle.add(dataMode2);
        editControllerAfFull.add(new TextEditingController());
        
      }else{
        listTitle.removeAt(index);
      }
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

    double height = MediaQuery.of(context).size.height;

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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Division:",style: TextStyle(fontSize:15.0,)),
                              Text("Khulna"),
                            ],
                          ),

                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("District:",style: TextStyle(fontSize:15.0)),
                              Text("Bagerhat"),
                            ],
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Upazila:",style: TextStyle(fontSize:15.0 )),
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
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            border: Border.all(color: Colors.black12)
                                        ),

                                        width: 250.0,
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
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 250.0,
                                      child: new Text(
                                          "No. of Deadiv",
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
                                      height: 55,
                                      width: 250.0,
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
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 250.0,
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
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 55,
                                      width: 250.0,
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
                                  //SizedBox(
                                  SizedBox(
                                    width: 2000.0,
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


                                            if(j==0){
                                              return new Container(
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
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
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      controller: editControllerAfFull[i],
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        //total_family_afected_full = editControllerAfl.text as int,
                                                        debugPrint("total ${editControllerAfFull[i].text}"),

                                                        for (var i = 0; i < editControllerAfFull.length; i++) {
                                                           totalAfFull += editControllerAfFull[i].text as int,

                                                            debugPrint('total: $family_full_af')
                                                          }

//                                                        if(j==1){
//                                                          listTitle[i].fullAffectedFamily = total_family_afected_full as String,
//                                                          for (var i = 0; i < listTitle.length; i++) {
//                                                            fm_full_aff = listTitle[i].fullAffectedFamily as int,
//                                                            family_full_af =  family_full_af+fm_full_aff,
//                                                            debugPrint('total: $family_full_af')
//                                                          }
//                                                        }
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
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      controller: editControllerAfHalf,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        //total_family_afected_full = editControllerAfl.text as int,
                                                        debugPrint("total ${editControllerAfHalf.text}"),

                                                        if(j==1){
                                                          listTitle[i].fullAffectedFamily = total_family_afected_full as String,
                                                          for (var i = 0; i < listTitle.length; i++) {
                                                            fm_full_aff = listTitle[i].fullAffectedFamily as int,
                                                            family_full_af =  family_full_af+fm_full_aff,
                                                            debugPrint('total: $family_full_af')
                                                          }
                                                        }
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
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      controller: editControHouseAfFull,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        //total_family_afected_full = editControllerAfl.text as int,
                                                        debugPrint("total ${editControHouseAfFull.text}"),

                                                        if(j==1){
                                                          listTitle[i].fullAffectedFamily = total_family_afected_full as String,
                                                          for (var i = 0; i < listTitle.length; i++) {
                                                            fm_full_aff = listTitle[i].fullAffectedFamily as int,
                                                            family_full_af =  family_full_af+fm_full_aff,
                                                            debugPrint('total: $family_full_af')
                                                          }
                                                        }
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
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black12)
                                                    ),
                                                    height: 55,
                                                    width: 125.0,
                                                    child: TextField(
                                                      controller: editControHouseAfHalf,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        //hintText: 'Enter a search term'
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 15),

                                                      onChanged: (value) => {
                                                        //total_family_afected_full = editControllerAfl.text as int,
                                                        debugPrint("total ${editControHouseAfHalf.text}"),

                                                        if(j==1){
                                                          listTitle[i].fullAffectedFamily = total_family_afected_full as String,
                                                          for (var i = 0; i < listTitle.length; i++) {
                                                            fm_full_aff = listTitle[i].fullAffectedFamily as int,
                                                            family_full_af =  family_full_af+fm_full_aff,
                                                            debugPrint('total: $family_full_af')
                                                          }
                                                        }
                                                      },

                                                    ),

                                                  ),
                                                ],

                                              );
                                            }
                                            if(j==5){
                                              return new Container(
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    controller: editControDeadDiv,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      debugPrint("total ${editControDeadDiv.text}"),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==6){
                                              return new Container(
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    controller: editControInjured,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      debugPrint("total ${editControInjured.text}"),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==7){
                                              return new Container(
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(
                                                  child: TextField(
                                                    controller: editControshelterNum,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      debugPrint("total ${editControshelterNum.text}"),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==8){
                                              return new Container(
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(

                                                  child: TextField(
                                                    controller: editControsPeoplehelterNum,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      debugPrint("total ${editControsPeoplehelterNum.text}"),
                                                    },
                                                  ),
                                                ),

                                              );
                                            }
                                            if(j==9){
                                              return new Container(
                                                //padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black12)
                                                ),
                                                height: 55,

                                                width: 250.0,
                                                child: Flexible(
                                                  child: TextField(
                                                    controller: editControDeadDiv,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      //hintText: 'Enter a search term'
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 15),
                                                    //controller: editController,
                                                    onChanged: (value) => {
                                                      debugPrint("total ${editControDeadDiv.text}"),
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
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),

                                      width: 250.0,
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
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  '$total_family_afected_full',
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
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  "",
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
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  border: Border.all(color: Colors.black12)
                                              ),
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  "",
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
                                              height: 40,
                                              width: 125.0,
                                              child: new Text(
                                                  "",
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
                                          color: Colors.black12,
                                          border: Border.all(color: Colors.black12)
                                      ),
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          "",
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
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          "",
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
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          "",
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
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          "",
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
                                      height: 40,
                                      width: 250.0,
                                      child: new Text(
                                          "",
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

