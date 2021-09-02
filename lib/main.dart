import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Card & Parsing",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card & Parsing"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new CardSaya(icon: Icons.home, teks: "home", warna: Colors.brown,),
            new CardSaya(icon: Icons.favorite, teks: "favorite", warna: Colors.pink,),
            new CardSaya(icon: Icons.place, teks: "Place", warna: Colors.blue,),
            new CardSaya(icon: Icons.settings, teks: "Setting", warna: Colors.black,),
            
          ],
        ),
      ),
    );
  }
}

class CardSaya extends StatelessWidget {
  CardSaya({this.icon, this.teks, this.warna});
  final IconData icon;
  final String teks;
  final Color warna;
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Card(
          child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: warna,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 20.0),
          )
        ],
      )),
    );
  }
}
