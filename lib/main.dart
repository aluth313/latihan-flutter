import 'package:flutter/material.dart';
import 'package:flutter_coba/post_result_model.dart';

void main() {
  runApp(new MaterialApp(
    title: "POST API Example",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("POST API Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.createdAt
                  : "tidak ada data"),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI("Luthfi", "Programmer").then((value){
                    postResult = value;
                    setState(() {
                      
                    });
                  });
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
