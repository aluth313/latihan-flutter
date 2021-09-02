import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Navigasi",
    home: new HalHallo(),
    routes: <String, WidgetBuilder>{
      '/HalHallo' : (BuildContext context) => new HalHallo(),
      '/HalDua' : (BuildContext context) => new HalDua(),
    },
  ));
}

class HalHallo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Music"),
        ),
        body: new Center(
          child: new IconButton(
              icon: new Icon(
                Icons.headset,
                size: 50.0,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/HalDua');
              }),
        ));
  }
}

class HalDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Speaker"),
        ),
        body: new Center(
          child: new IconButton(
              icon: new Icon(
                Icons.speaker,
                size: 50.0,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/HalHallo');
              }),
        ));
  }
}