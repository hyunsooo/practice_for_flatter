import 'package:flutter/material.dart';

void main() => runApp(new GettingStartedApp());

class GettingStartedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Getting Started Title",
        // home: new Center ( child: new Text("Centered Text") )
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("HYUNSOO Bar Title"),
            ),
            body: new HomeWidget()));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 20,
      itemBuilder: (context, rowNumber) {
        return Container(
            padding: new EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                new Image.network("http://goo.gl/vFdXGc"),
                new Text(
                    "Instagram Firebase course: check it out using description link below",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0)),
                new Divider(color: Colors.green)
              ],
            ));
      },
    );
  }
}
