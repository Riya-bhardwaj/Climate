import 'package:climateapp/api.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:climateapp/util/Util.dart' as util;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
 final String city;
   final String country;
  Home({ Key key,this.city,this.country}):super(key :key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data;

  @override
  void initState() {
    print('${widget.city}');
    print('${widget.country}');
    fetch();
    super.initState();
  }

  void fetch() async {
    data = await getweather(util.appId, '${widget.city}', '${widget.country}');
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double weidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Climate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.menu), onPressed: () {})
          ],
        ),
        body: Stack(
          children: <Widget>[
            new Center(
              child: Image.asset(
                "assets/umbrella.png",
                width: weidth,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 10.9, 20.9, 0),
              child: new Text(
                " ${widget.city}",
                style: citystyle(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/light_rain.png"),
            ),
            Container(
             margin: const EdgeInsets.fromLTRB(30, 350, 0, 0),
              alignment: Alignment.center,
              child: updateTempWidgrt(String),
            ),
          ],
        ));
  }

  Widget updateTempWidgrt(String) {
    return FutureBuilder(
        future: getweather(util.appId, '${widget.city}', '${widget.country}'),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                  (content['main']['temp'].toString()+"F"),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 49,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(dense: true,
                    title: Text(
                      ("Max :"+content['main']['temp_max'].toString()+"F"),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(dense: true,
                    title: Text(
                      ("Min :"+content['main']['temp_min'].toString()+"F"),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(dense: true,
                    title: Text(
                  ("Humidity :"+content['main']['humidity'].toString()),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}

TextStyle citystyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 29,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle() {
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49,
  );
}
