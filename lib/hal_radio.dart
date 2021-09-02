import 'package:flutter/material.dart';

class Radio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("Radio", style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Image(image: new NetworkImage("https://w7.pngwing.com/pngs/346/79/png-transparent-internet-radio-computer-icons-radio-electronics-fm-broadcasting-radio-station-thumbnail.png"), width: 200.0,)
          ],
        ),
      ),
    );
  }
}