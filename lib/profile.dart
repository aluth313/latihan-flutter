import 'package:flutter/material.dart';
import 'package:flutter_coba/home.dart';
import 'package:flutter_coba/pindah.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
              ),
            ),
            RaisedButton(
              child: Text("Pindah"),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Pindah())))
          ],
        ),
      ),
    );
  }
}