import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Grid dan Hero",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  List<Container> daftarCaleg = new List();
  var caleg = [
    {"nama": "Nurhadi1", "gambar": "n1.jpg"},
    {"nama": "Nurhadi2", "gambar": "n2.jpg"},
    {"nama": "Nurhadi3", "gambar": "n3.jpeg"},
    {"nama": "Nurhadi4", "gambar": "n4.jpg"},
    {"nama": "Nurhadi5", "gambar": "n5.jpg"},
    {"nama": "Nurhadi6", "gambar": "n6.jpg"},
    {"nama": "Nurhadi7", "gambar": "n7.jpg"},
    {"nama": "Nurhadi8", "gambar": "n8.jpg"}
  ];

  _buatlist() async {
    for (var i = 0; i < caleg.length; i++) {
      final calegnya = caleg[i];
      final String gambar = calegnya["gambar"];
      daftarCaleg.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Hero(
                  tag: calegnya["nama"],
                  child: new Material(
                    child: new InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Detail(
                          nama: calegnya["nama"],
                          gambar: gambar,
                        ),
                      )),
                      child: new Image.asset(
                        "img/$gambar",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Text(
                  calegnya["nama"],
                  style: new TextStyle(fontSize: 20.0),
                )
              ],
            ),
          )));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Grid dan Hero"),
        backgroundColor: Colors.red,
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarCaleg,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          new Bagiannama(
            nama: nama,
          ),
          new Bagianicon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class Bagiannama extends StatelessWidget {
  Bagiannama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Bagianicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 10.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: new TextStyle(fontSize: 20.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
