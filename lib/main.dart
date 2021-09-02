import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new HalHallo(data: new List<String>.generate(300, (index) => "ini data ke $index"),),
  ));
}

class HalHallo extends StatelessWidget {
  final List<String> data;
  HalHallo({this.data});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber[900],
        title: new Text("Listview"),
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            return new ListTile(
              leading: new Icon(Icons.widgets),
              title: new Text("${data[index]}"),
            );
          },
        ),
      )
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
