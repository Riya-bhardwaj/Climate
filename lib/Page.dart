import 'package:climateapp/Home.dart';
import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  TextEditingController Citycontroller = new TextEditingController();
  TextEditingController Countrycontroller = new TextEditingController();

  void Fun() {
    var route = new MaterialPageRoute(builder: (BuildContext contetext) {
      return Home(
        city: Citycontroller.text,
        country: Countrycontroller.text,
      );
    });
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double weidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Climate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Colors.redAccent
        ,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/sunset.jpeg"),fit: BoxFit.fill
            ),

          ),
          child: Column(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
                child: TextField(
                  controller: Citycontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'City', contentPadding: EdgeInsets.all(10)),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
                child: TextField(
                    controller: Countrycontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Country',
                        contentPadding: EdgeInsets.all(10)),
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                  child: Text("Submit",style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    Fun();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
