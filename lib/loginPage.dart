
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wfp/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class loginPage extends StatefulWidget{

          loginPage() : super();
          @override
          loginPageState createState() => loginPageState();
        }

class LoginResponse {

  //errormsg,successmsg,authentication_access
  String success,message;

  Authentication_info user_info = new Authentication_info();

  // Logged_session_data logged_session_data = new Logged_session_data();


  LoginResponse({this.success, this.message,this.user_info});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      user_info:Authentication_info.fromJson(json['user_info']),
      // logged_session_data:Logged_session_data.fromJson(json['logged_session_data'])
    );
  }
}




class Authentication_info {
  String username,email,name,role;

  Authentication_info({ this.username,this.email,this.name,this.role});

  factory Authentication_info.fromJson(Map<String, dynamic> json) {
    return Authentication_info(
        username: json['username'],
        email: json['email'],
        name: json['name'],
        role: json['role'],
    );
  }
}


class loginPageState extends State<loginPage>{
          TextEditingController emailController = new TextEditingController();
          TextEditingController passwordController = new TextEditingController();
          LoginResponse data;
          GlobalKey<FormState> _key = new GlobalKey();
          bool _autoValidate = false;
          String _email;
          String _password;
          int _state = 0;

          @override
          void initState() {

            super.initState();
          }

          Widget setUpButtonChild() {
            if (_state == 0) {
              return new Text(
                " Sign In",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              );
            } else if (_state == 1) {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
            } else {
              return Icon(Icons.check, color: Colors.white);
            }
          }

          void animateButton() {
            setState(() {
              _state = 1;
            });

          }

          Future<LoginResponse> fetchPost(String email,String pass) async {

            try {
              final result = await InternetAddress.lookup('google.com');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                print('no connected');
              }
            } on SocketException catch (_) {
              print('not connected');
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has typed in using our
                    // TextEditingController
                    content: Text("No Internet Connection!"),
                  );
                },
              );
            }

            setState(() {
              if (_state == 0) {
                animateButton();
              }
            });

            http.Response response = await http.post("http://www.sromik-jigyasha.blast.org.bd/blast_new/api/sign_in",
                body: {'user_name': email, 'password': pass}); // post api call
            if (response.statusCode == 200) {
              // If the call to the server was successful, parse the JSON
              //SharedPreferences prefs = await SharedPreferences.getInstance();

              //_saveValues(data.user);
              setState(() {
                _state = 2;
                //prefs.setString('username', 'moinul35ac@gmai.com');

                //print("MSG"+prefs.getString('username'));
                // _onChanged(true,data.user.full_name,data.user.warehouse_name,data.user.warehouse_id);
              });
//              final LoginResponse data = LoginResponse.fromJson(json.decode(response.body));
//              debugPrint('loginreponse: ${data.success}');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));


            } else {
              // If that call was not successful, throw an error.
              throw Exception('Failed to load post');
            }
          }
          _sendToServer() {
            if (_key.currentState.validate()) {
              // No any error in validation
              _key.currentState.save();
              print("Email $_email");
              print("Password $_password");
              fetchPost(_email,_password);

            } else {
              // validation error
              setState(() {
                _autoValidate= true;
              });
            }
          }


          @override
          Widget build(BuildContext context) {

            return Scaffold(

                body: Padding(
                    padding: EdgeInsets.all(15),
                    child: ListView(
                      children: <Widget>[

                        SizedBox(
                          height: 30.0,
                        ),
                    Container(
                    alignment: Alignment.center,
                      child: Image.asset('images/govlogo.png', scale: 1.0, width: 120.0, height: 120.0,fit: BoxFit.contain),
//                      Text("Ministry of Disaster Management & Relief",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                        Container(
                          alignment: Alignment.center,
                          child:Text("Ministry of Disaster Management & Relief",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
//                        Image.asset('images/ic_launcher.png', scale: 1.0, width: 150.0, height: 150.0,fit: BoxFit.contain),

//                        Container(
//                            alignment: Alignment.center,
//                            padding: EdgeInsets.all(10),
//                            child: Text(
//                              'Sign in',
//                              style: TextStyle(fontSize: 20),
//                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
//                        FlatButton(
//                          onPressed: (){
//                            //forgot password screen
//                          },
//                          textColor: Colors.blue,
//                          child: Text('Forgot Password'),
//                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 40.0),
                          width: 200.0,
                          height: 50.0,
                          child :  new RaisedButton(
                            textColor: Colors.white,
                            //child: const Text(' Sign In   '),
                            color: Theme.of(context).accentColor,
                            elevation: 8.0,
                            splashColor: Colors.blueGrey,
                            //onPressed: _sendToServer,
                            child: setUpButtonChild(),
                            onPressed: () {
                              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageDrawerParticipant()));
                             // _sendToServer();

                              fetchPost(emailController.text,passwordController.text);
                            },

//            onPressed: () {
//              return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(
//                    // Retrieve the text the user has typed in using our
//                    // TextEditingController
//                    content: Text(emailController.text),
//                  );
//                },
//              );
//            },

                          ),
                        ),

                      ],
                    )));

          }


        }
