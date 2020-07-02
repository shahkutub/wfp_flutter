
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
//          createDrawerBodyItem(
//            icon: Icons.home,
//            text: 'Home',
//            onTap: () =>
//                Navigator.pushReplacementNamed(context, pageRoutes.home),
//          ),
          createDrawerBodyItem(
            icon: Icons.add,
            text: 'Primary Incident',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.primaryincident),
          ),

//          createDrawerBodyItem(
//            icon: Icons.event_note,
//            text: 'Events',
//            //onTap: () =>
//               // Navigator.pushReplacementNamed(context, pageRoutes.event),
//          ),
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