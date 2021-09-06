import 'package:flutter/material.dart';
import 'package:flutter_coba/home.dart';
import 'package:flutter_coba/profile.dart';
import 'package:flutter_coba/setting.dart';

class Drawerku extends StatelessWidget {
  final Function onTap;
  Drawerku({this.onTap});

  int index=0;
  List<Widget> list = [
    Home(),
    Profile(),
    Setting()
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn-2.tstatic.net/batam/foto/bank/images/poster-film-avengers-infinity-war_20180423_071011.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Ahmad Luthfi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "luthfiahmad36@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: ()=> onTap(context,0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: ()=> onTap(context,1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: ()=> onTap(context,2),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: ()=> onTap(context,0),
            ),
          ],
        ),
      ),
    );
  }
}