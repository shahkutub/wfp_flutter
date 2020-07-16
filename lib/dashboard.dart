
import 'package:flutter/material.dart';
import 'package:wfp/Fragments/dashboardMapPage.dart';
import 'package:wfp/Fragments/primaryincidentPagecopy.dart';
import 'package:wfp/Fragments/warehouseListPage.dart';

import 'Fragments/homePage.dart';
import 'Fragments/shelterListPage.dart';
import 'package:wfp/routes/pageRoute.dart';
import 'Fragments/primaryincidentPage.dart';
import 'Fragments/shelterMapPage.dart';
import 'Fragments/warehouseMapPage.dart';
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
      home: dashboardMapPage(),
      routes:  {
      pageRoutes.home: (context) => homePage(),
      pageRoutes.shelter: (context) => shelterListPage(),
      pageRoutes.warehouse: (context) => warehouseListPage(),
      pageRoutes.primaryincident: (context) => primaryincidentPage(),
      pageRoutes.sheltermap: (context) => shelterMapPage(),
      pageRoutes.warehousemap: (context) => warehouseMapPage(),
      pageRoutes.dashboardmap: (context) => dashboardMapPage(),
      //pageRoutes.primaryincident: (context) => primaryincidentPagecopy(),
      //pageRoutes.profile: (context) => primaryincidentPagecopy(),
      //pageRoutes.profile: (context) => profilePage(),
      //pageRoutes.notification: (context) => notificationPage(),
      },
      );
      }
      }