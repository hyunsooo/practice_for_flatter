import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return new RealWorldState();
    }
}

class RealWorldState extends State<StatefulWidget> {
  var _isLoading = true;  // using underscore means private variable

  _fetchData() async {
    print("Attempting to fetch data from network");

    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final videosJson = map["videos"];

      videosJson.forEach((video) {
        print(video["name"]);
      });
      // print(map["videos"]);
    }
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("REAL WORLD APP BAR"),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.refresh),
              onPressed: () {
                print("Reloading..."); 
                setState(() {
                  _isLoading = false;           
                });
                _fetchData();
              },)
            ],
          ),
          body: new Center(
            child: _isLoading ? new CircularProgressIndicator() 
            : new Text("Finished Loading!!!!!!!!!!!.."),

          )
        )
      );
    }
}