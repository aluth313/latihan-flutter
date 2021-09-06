import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Data Table",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  List dataJson;
  Future<String> ambilData() async {
    http.Response hasil = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {"Accept": "application/json"}
    );

    this.setState(() {
      dataJson = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Data Table"),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                "List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            DataTable(columns: [
              DataColumn(
                  label: Text("ID",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Title",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Body",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Nyoba",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ], rows: List.generate(dataJson.length, (index) {
              return DataRow(cells: [
                DataCell(Text(dataJson[index]['id'].toString())),
                DataCell(Text(dataJson[index]['title'].toString())),
                DataCell(Text(dataJson[index]['body'].toString())),
                DataCell(Text(dataJson[index]['body'].toString())),
              ]);
            })
            // [
            //   DataRow(cells: [
            //     DataCell(Text("1")),
            //     DataCell(Text("Dadang")),
            //     DataCell(Text("Dosen")),
            //   ]),
            //   DataRow(cells: [
            //     DataCell(Text("2")),
            //     DataCell(Text("Ujang")),
            //     DataCell(Text("Staf")),
            //   ]),
            //   DataRow(cells: [
            //     DataCell(Text("3")),
            //     DataCell(Text("Jono")),
            //     DataCell(Text("OB")),
            //   ]),
            // ]
            )
          ],
        ),
      ),
    );
  }
}
