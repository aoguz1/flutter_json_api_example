import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterlearn_json_api/local_json.dart';
import 'package:flutterlearn_json_api/models/araba_model.dart';
import 'package:flutterlearn_json_api/local_json.dart';
import 'package:flutterlearn_json_api/remote_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter API",
      home: MyHomePagePage(),

    );
  }
}




class MyHomePagePage extends StatelessWidget {
  const MyHomePagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.orange,
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocalJson()));

                },
                child: Text("Local API"),
              ),

              RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RemoteApi()));
              },child: Text("Remote API"),color: Colors.amber,)
            ],
          ),
        ),
      ),
    );
  }
}
