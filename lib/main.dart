import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    title: "Gradient, PageView, Circle Hero Animatian, MENU Dropdown",
    home: new HalHallo(),
  ));
}

class HalHallo extends StatefulWidget {
  @override
  _HalHalloState createState() => _HalHalloState();
}

class _HalHalloState extends State<HalHallo> {
  final List<String> gambar = ["1.jpg", "2.jpg", "3.jpg", "4.jpg"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
              "Gradient, PageView, Circle Hero Animatian, MENU Dropdown"),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [Colors.red, Colors.yellow, Colors.green])),
          child: new PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: gambar.length,
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 22.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    elevation: 10.0,
                    child: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Hero(
                            tag: gambar[i],
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Halamandua(
                                            gambar: gambar[i],
                                          ))),
                              child: new Image.asset(
                                "img/${gambar[i]}",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({this.gambar});
  final String gambar;

  @override
  _HalamanduaState createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan){
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("DOTA HERO"),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
            return listPilihan.map((Pilihan x) {
              return PopupMenuItem(
                child: Text(x.teks),
                value: x,
              );
            }).toList();
          })
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(center: Alignment.center, colors: [
              Colors.blue,
              warna,
              Colors.black.withOpacity(0.9),
            ])),
          ),
          Center(
            child: Hero(
                tag: widget.gambar,
                child: ClipOval(
                  child: SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Material(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          "img/${widget.gambar}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class Pilihan {
  const Pilihan({this.teks, this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Strength", warna: Colors.red),
  const Pilihan(teks: "Agility", warna: Colors.green),
  const Pilihan(teks: "Intelligence", warna: Colors.blue),
];
