
import 'package:flutter/material.dart';
import 'package:wfp/Fragments/primaryincidentPagecopy.dart';

import 'Fragments/homePage.dart';
import 'Fragments/shelterListPage.dart';
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
      home: primaryincidentPage(),
      routes:  {
      pageRoutes.home: (context) => homePage(),
      pageRoutes.contact: (context) => contactPage(),
      pageRoutes.primaryincident: (context) => primaryincidentPage(),
      //pageRoutes.primaryincident: (context) => primaryincidentPagecopy(),
      //pageRoutes.profile: (context) => primaryincidentPagecopy(),
      //pageRoutes.profile: (context) => profilePage(),
      //pageRoutes.notification: (context) => notificationPage(),
      },
      );
      }
      }