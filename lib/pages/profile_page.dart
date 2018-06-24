import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
        child: new InkWell(
          onTap: () => print("We Tapped the page"),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Profile Page", style: new TextStyle(color: Colors.grey, fontSize: 50.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
    );
  }
}