
import 'package:flutter/material.dart';
import 'package:wfp/widgets/createDrawerBodyItem.dart';
import 'package:wfp/widgets/createDrawerHeader.dart';
import 'package:wfp/routes/pageRoute.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Dashboard',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.dashboardmap),
          ),
          createDrawerBodyItem(
            icon: Icons.add,
            text: 'Primary Incident Form',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.primaryincident),
          ),

          createDrawerBodyItem(
            icon: Icons.view_list,
            text: 'Update Shelter Center',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.shelter),
          ),

          createDrawerBodyItem(
            icon: Icons.view_list,
            text: 'Update Warehouse',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.warehouse),
          ),


          createDrawerBodyItem(
            icon: Icons.map,
            text: 'Shelter Center Map',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.sheltermap),
          ),

          createDrawerBodyItem(
            icon: Icons.map,
            text: 'Warehouse Map',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.warehousemap),
          ),


//          Divider(),
//          createDrawerBodyItem(
//            icon: Icons.notifications_active,
//            text: 'Notifications',
//            //onTap: () =>
//                //Navigator.pushReplacementNamed(context, pageRoutes.notification),
//          ),
//          createDrawerBodyItem(
//            icon: Icons.contact_phone,
//            text: 'Contact Info',
//            onTap: () =>
//                Navigator.pushReplacementNamed(context, pageRoutes.contact),
//          ),
//          ListTile(
//            title: Text('App version 1.0.0'),
//            onTap: () {},
//          ),
        ],
      ),
    );
  }
}