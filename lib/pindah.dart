import 'package:flutter/material.dart';
import 'package:flutter_coba/drawerku.dart';

class Pindah extends StatefulWidget {
  @override
  _PindahState createState() => _PindahState();
}

class _PindahState extends State<Pindah> {
  // int posisi=0;
  // Pindah({this.posisi});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: Drawerku().list[Drawerku().index],
        drawer: Drawerku(onTap: (ctx,i){
          setState(() {
            Drawerku().index=i;
            Navigator.pop(ctx);
          });
        }),
      ),
    );
  }
}