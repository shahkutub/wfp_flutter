import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:wfp/dashboard.dart';
import 'package:wfp/loginPage.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    title: 'Carousel Pro',
    home: CarouselPage(),
  ));
}

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("WFP"),
      ),

      body: Column(


        children: [


          SizedBox(
            height: 10.0,
          ),
          SizedBox(

            height: 280.0,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              boxFit: BoxFit.none,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 3000),
              dotSize: 6.0,
              dotIncreasedColor: Color(0xFFFF335C),
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.topRight,
              dotVerticalPadding: 5.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              borderRadius: true,


              images: [
                ExactAssetImage("images/1.jpg"),
                ExactAssetImage("images/2.jpg"),
                ExactAssetImage("images/3.jpg"),
              ],
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Image.asset('images/ic_launcher.png', scale: 1.0, width: 150.0, height: 150.0,fit: BoxFit.contain),

          SizedBox(
            height: 20.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(

                onTap: () {
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 60.0,
                  width: 200.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(

                          color: Colors.green,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                          )
                      ),
                      child: new Center(

                        child: new Text(" Log IN ",
                          style: TextStyle(color: Colors.white,fontSize: 20.0),
                        ),
                      )
                  ),
                ),
              ),



//              Container(
//                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
//                height: 60.0,
//                width: 140.0,
//                color: Colors.transparent,
//                child: new Container(
//                    decoration: new BoxDecoration(
//
//                        color: Colors.green,
//                        borderRadius: new BorderRadius.only(
//                          topLeft: const Radius.circular(5.0),
//                          topRight: const Radius.circular(5.0),
//                          bottomLeft: const Radius.circular(5.0),
//                          bottomRight: const Radius.circular(5.0),
//                        )
//                    ),
//                    child: new Center(
//                      child: new Text(" Sign UP ",
//                        style: TextStyle(color: Colors.white),
//                      ),
//                    )
//                ),
//              )

            ],
          )
        ],
      ),



    );
  }
}
