import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class User extends StatelessWidget {
  final Map<String, dynamic> data;
  User(this.data);
  Widget build(BuildContext context) {
    double temp = data['users']['eid'];
    return new Text(
      '${temp.toStringAsFixed(1)}',
      style: Theme.of(context).textTheme.display4,
    );
  }
}

class SearchPage extends StatefulWidget {
  MySearchPageState createState() => new MySearchPageState();
}

class MySearchPageState extends State<SearchPage> {
  Future<http.Response> _response;

  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _response = http.get(
        'https://irewards.000webhostapp.com/irewards-api/v1/users'
      );
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new FutureBuilder(
          future: _response,
          builder: (BuildContext context, AsyncSnapshot<http.Response> response) {

//start
            if (!response.hasData){
              return new Text('Loading...');
            }else if (response.data.statusCode != 200) {
              return new Text('Could not connect to service.');
            } else {
              List lstUsers;
              Map<String, dynamic> json = JSON.decode(response.data.body);
              lstUsers = json['users'];
              
              if (json['error'] == false){
                  return new ListView.builder(
                      itemCount: lstUsers.length,
                      itemBuilder: (BuildContext context, int index) {
                        
                        String fname = json['users'][index]['fname'].toString();
                        String lname = json['users'][index]['lname'].toString();
                        String eid = json['users'][index]['eid'].toString();

                        return new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.person, size: 50.0,),
                              title: new Text(fname + " " + lname),
                              subtitle: new Text(eid),
                            ),
                            new Divider(height: 20.0,),
                          ],
                        );
                      },
                  );
              }else{
                return new Text('Service error: $json.');
              }
            }
//end

          }
        )
      ),
    );
  }
}