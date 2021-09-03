import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Form",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  List<String> agama = ["islam", "kristen", "hindu", "budha"];
  String _agama = "islam";
  String _jk = "";
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: [
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Motto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            RaisedButton(child: Text("OK"), onPressed: ()=> Navigator.pop(context)),
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.list),
          title: new Text("Form"),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              new Container(
                child: Column(
                  children: [
                    TextField(
                      controller: controllerNama,
                      decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextField(
                      controller: controllerPass,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextField(
                      controller: controllerMoto,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Motto Hidup",
                          labelText: "Motto Hidup",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    RadioListTile(
                      value: "Laki-laki",
                      title: Text("Laki-laki"),
                      groupValue: _jk,
                      onChanged: (String value) {
                        _pilihJk(value);
                      },
                      subtitle: Text("Pilih ini jika Anda Laki-laki"),
                    ),
                    RadioListTile(
                      value: "Perempuan",
                      title: Text("Perempuan"),
                      groupValue: _jk,
                      onChanged: (String value) {
                        _pilihJk(value);
                      },
                      subtitle: Text("Pilih ini jika Anda Perempuan"),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Row(
                      children: [
                        Text(
                          "Agama",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: DropdownButton(
                              value: _agama,
                              items: agama.map((String value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (String value) {
                                pilihAgama(value);
                              }),
                        )
                      ],
                    ),
                    RaisedButton(child: Text("OK"), onPressed: (){
                      kirimdata();
                    })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
