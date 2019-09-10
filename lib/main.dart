import 'package:climateapp/Home.dart';
import 'package:climateapp/Page.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.blueGrey,
      accentColor: Colors.blueGrey,
      indicatorColor: Colors.white,
      hintColor: Colors.white
    ),
      title: 'Climate App',home: Page(),);
  }
}


