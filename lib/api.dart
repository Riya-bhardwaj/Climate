import 'package:climateapp/util/Util.dart' as util;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'dart:convert';


Future<Map> getweather(String appId,String city,String country)async
{        //  http://api.openweathermap.org/data/2.5/weather?q=Delhi,India&APPID=5a5482fb95fc61c690d4586301209bef
  String url='http://api.openweathermap.org/data/2.5/weather?q=$city,$country&APPID=${util.appId}&units=Fahrenheit';
  http.Response response=await http.get(url);
  return json.decode(response.body);


}
