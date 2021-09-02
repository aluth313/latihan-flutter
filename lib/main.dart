import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "List View",
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Sidebar (DRAWER)"),
        backgroundColor: Colors.red,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(nama1),
              accountEmail: new Text("ujang@gmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            nama: nama1,
                            gambar: gambar1,
                          )));
                },
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://cdn0-production-images-kly.akamaized.net/M214oOJllSwlY3KqwGxuJ2G6qw4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3343563/original/001361400_1610083119-neon-light-arrow-direction-perspective_1017-22033.jpg"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                    onTap: () => gantiUser(),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(gambar2),
                    )),
              ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: new Container(),
    );
  }
}
