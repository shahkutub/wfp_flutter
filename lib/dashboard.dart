
import 'package:flutter/material.dart';

import 'Fragments/homePage.dart';
import 'Fragments/contactPage.dart';
import 'package:wfp/routes/pageRoute.dart';
import 'Fragments/primaryincidentPage.dart';
//import 'Fragments/primaryincidentPagecopy.dart';


      class dashboard extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
      return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: homePage(),
      routes:  {
      pageRoutes.home: (context) => homePage(),
      //pageRoutes.contact: (context) => primaryincidentPagecopy(),
      pageRoutes.primaryincident: (context) => primaryincidentPage(),
      //pageRoutes.profile: (context) => primaryincidentPagecopy(),
      //pageRoutes.profile: (context) => profilePage(),
      //pageRoutes.notification: (context) => notificationPage(),
      },
      );
      }
      }