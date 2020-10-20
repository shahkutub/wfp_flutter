
import 'dart:convert';

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
            final String todo = ModalRoute.of(context).settings.arguments;
            debugPrint('loginData: ${todo}');

            Map<String, dynamic> user = jsonDecode(todo);
            debugPrint('Name: ${user['UserName']}');
            debugPrint('Division: ${user['Division']['DivisionName']}');
            debugPrint('District: ${user['District']['DistrictName']}');

            // Map<String, dynamic> Division = jsonDecode(user['Division'].toString());
            // debugPrint('Division: ${Division['DivisionName']}');


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

            // onGenerateRoute: (settings) {
            //       if (settings.name == pageRoutes.home) {
            //             MaterialPageRoute(
            //                   builder: (context) => homePage(),
            //                   settings: RouteSettings(
            //                       arguments: todo
            //                   ),
            //             );
            //       }
            //
            //       if (settings.name == pageRoutes.shelter) {
            //             MaterialPageRoute(
            //                   builder: (context) => primaryincidentPage(),
            //                   settings: RouteSettings(
            //                       arguments: todo
            //                   ),
            //             );
            //       }
            //
            //       if (settings.name == pageRoutes.shelter) {
            //             MaterialPageRoute(
            //                   builder: (context) => shelterListPage(),
            //                   settings: RouteSettings(
            //                       arguments: todo
            //                   ),
            //             );
            //       }
            //
            //       if (settings.name == pageRoutes.warehouse) {
            //             MaterialPageRoute(
            //                   builder: (context) => warehouseListPage(),
            //                   settings: RouteSettings(
            //                       arguments: todo
            //                   ),
            //             );
            //       }
            //
            //       if (settings.name == pageRoutes.primaryincident) {
            //             MaterialPageRoute(
            //                   builder: (context) => primaryincidentPage(),
            //                   settings: RouteSettings(
            //                       arguments: todo
            //                   ),
            //             );
            //       }
            // },

      );
      }
      }