
import 'package:flutter/material.dart';
import 'package:wfp/Fragments/dashboardMapPage.dart';
import 'package:wfp/Fragments/homePage.dart';
import 'package:wfp/Fragments/shelterListPage.dart';
import 'package:wfp/Fragments/warehouseListPage.dart';
import 'package:wfp/Fragments/primaryincidentPage.dart';
import 'package:wfp/Fragments/shelterMapPage.dart';
import 'package:wfp/Fragments/warehouseMapPage.dart';

class pageRoutes {
  static const String home = homePage.routeName;
  static const String shelter = shelterListPage.routeName;
  static const String warehouse = warehouseListPage.routeName;
  static const String primaryincident = primaryincidentPage.routeName;
  static const String sheltermap = shelterMapPage.routeName;
  static const String warehousemap = warehouseMapPage.routeName;
  static const String dashboardmap = dashboardMapPage.routeName;
  //static const String profile = primaryincidentPage.routeName;
//  static const String notification = notificationPage.routeName;
}