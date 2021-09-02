import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as smartphone;

void main() {
  runApp(new MaterialApp(
    title: "Tap Bar",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
              text: "Komputer",
            ),
            new Tab(
              icon: new Icon(Icons.headset),
              text: "Headset",
            ),
            new Tab(
              icon: new Icon(Icons.radio),
              text: "Radio",
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),
              text: "Smartphone",
            ),
          ],
        ),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new komputer.Komputer(),
        new headset.Headset(),
        new radio.Radio(),
        new smartphone.Smartphone(),
      ]),
      
      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
            ),
            new Tab(
              icon: new Icon(Icons.headset),
            ),
            new Tab(
              icon: new Icon(Icons.radio),
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),
            ),
          ],
        ),
      ),
    );
  }
}
