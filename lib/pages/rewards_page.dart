import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
        child: new InkWell(
          onTap: () => print("We Tapped the page"),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Rewards Page", style: new TextStyle(color: Colors.grey, fontSize: 50.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
    );
  }
}