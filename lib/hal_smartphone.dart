import 'package:flutter/material.dart';

class Smartphone extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Smartphone", style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Image(image: new NetworkImage("https://png.pngtree.com/element_our/20190602/ourmid/pngtree-hand-drawn-smartphone-illustration-image_1401996.jpg"), width: 200.0,)
          ],
        ),
      ),
    );
  }
}