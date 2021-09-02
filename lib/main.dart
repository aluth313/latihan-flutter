import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber[900],
        title: new Text("Listview"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListAlat(
            gambar:
                "https://w7.pngwing.com/pngs/346/79/png-transparent-internet-radio-computer-icons-radio-electronics-fm-broadcasting-radio-station-thumbnail.png",
            judul: "RADIO",
          ),
          new ListAlat(
            gambar:
                "https://png.pngtree.com/element_our/20190602/ourmid/pngtree-hand-drawn-smartphone-illustration-image_1401996.jpg",
            judul: "SMARTPHONE",
          ),
          new ListAlat(
            gambar:
                "https://png.pngtree.com/element_our/20190602/ourmid/pngtree-hand-drawn-smartphone-illustration-image_1401996.jpg",
            judul: "SMARTPHONE",
          ),
          new ListAlat(
            gambar:
                "https://png.pngtree.com/element_our/20190602/ourmid/pngtree-hand-drawn-smartphone-illustration-image_1401996.jpg",
            judul: "SMARTPHONE",
          ),
        ],
      ),
    );
  }
}

class ListAlat extends StatelessWidget {
  ListAlat({this.gambar, this.judul});

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(
              image: new NetworkImage(gambar),
              width: 200.0,
            ),
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      judul,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Text("ini adalah deskripsi", style: new TextStyle(fontSize: 15.0, color: Colors.grey),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
