
import 'package:flutter/material.dart';
import 'package:wfp/dashboard.dart';


        class loginPage extends StatefulWidget{

          loginPage() : super();
          @override
          loginPageState createState() => loginPageState();
        }

        class loginPageState extends State<loginPage>{


          @override
          void initState() {

            super.initState();
          }

          @override
          Widget build(BuildContext context) {

            return Scaffold(

                body: Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: <Widget>[
//                        Container(
//                            alignment: Alignment.center,
//                            padding: EdgeInsets.all(10),
//                            child: Text(
//                              'Emergency Operation',
//                              style: TextStyle(
//                                  color: Colors.blue,
//                                  fontWeight: FontWeight.w500,
//                                  fontSize: 20),
//                            )
//
//                        ),

                        Image.asset('images/ic_launcher.png', scale: 1.0, width: 150.0, height: 150.0,fit: BoxFit.contain),

                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            //controller: nameController,
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
                            //controller: passwordController,
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
                        Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Login'),
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
                               // print(nameController.text);
                                //print(passwordController.text);
                              },
                            )),
//                        Container(
//                            child: Row(
//                              children: <Widget>[
//                                Text('Does not have account?'),
//                                FlatButton(
//                                  textColor: Colors.blue,
//                                  child: Text(
//                                    'Sign in',
//                                    style: TextStyle(fontSize: 20),
//                                  ),
//                                  onPressed: () {
//                                    //signup screen
//                                  },
//                                )
//                              ],
//                              mainAxisAlignment: MainAxisAlignment.center,
//                            ))
                      ],
                    )));

          }


        }
