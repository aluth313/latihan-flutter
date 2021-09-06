import 'package:flutter/material.dart';
import 'package:flutter_coba/drawerku.dart';
import 'package:flutter_coba/home.dart';
import 'package:flutter_coba/profile.dart';
import 'package:flutter_coba/setting.dart';

void main() {
  runApp(new MaterialApp(
    title: "Fragment",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  String gambar1 =
      "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1619493558/u3wutzogf853ksr2lncw_ujx6f6.jpg";
  String gambar2 =
      "https://cdn-2.tstatic.net/batam/foto/bank/images/poster-film-avengers-infinity-war_20180423_071011.jpg";
  String backup;
  String nama1 = "Ujang";
  String nama2 = "Avengers";
  String backupnama;

  void gantiUser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;
    });
  }

  int index=0;
  List<Widget> list = [
    Home(),
    Profile(),
    Setting()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: list[index],
        drawer: Drawerku(onTap: (ctx,i){
          setState(() {
            index=i;
            Navigator.pop(ctx);
          });
        }),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

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