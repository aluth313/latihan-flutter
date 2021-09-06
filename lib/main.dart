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
        Uri.encodeFull("http://10.0.2.2/example-app/public/api/students"),
        headers: {"Accept": "application/json"});

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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text("ID",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("Nama",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("Kelas",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("Kelas",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                    rows: List.generate(dataJson.length, (index) {
                      return DataRow(cells: [
                        DataCell(Text(dataJson[index]['id'].toString())),
                        DataCell(Text(dataJson[index]['nama'].toString())),
                        DataCell(Text(dataJson[index]['kelas'].toString())),
                        DataCell(Text(dataJson[index]['kelas'].toString())),
                      ]);
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
