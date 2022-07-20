import 'dart:convert';

import 'dart:math';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    //print("object");
  }

  @override
  Widget build(BuildContext context) {
    
    
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp=info["temp_value"].toString().substring(0,4);
    
    
    var city_name = ["Mumbai", "Delhi", "Channai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    String icon=info["icon1"];
    //print(icon);
    String getcity=info["city_value"];
    String hum=info["hum_value"];
    String air=info["air_speed_value"].toString().substring(0,4);
    String des=info["des_value"];

    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: PreferredSize(
      //preferredSize: Size.fromHeight(0),
      //child: AppBar(
      //backgroundColor: Colors.green,
      // ),
      //0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade800, Colors.blue.shade300])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //print(searchController.text);
                        //Navigator.pushNamed(context, "/loading",arguments: {
                          //"searchText":searchController.text
                        //});
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                          
                          controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Search $city", border: InputBorder.none),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      //height: 78,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 26),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network("http://openweathermap.org/img/wn/$icon@2x.png",
                          
                         
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text(
                                "$des",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "In $getcity",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                "C",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(20),
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("km/hr")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 22, 0),
                      padding: EdgeInsets.all(20),
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("percentage")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(23),
                child: Column(
                  children: [
                    Text("Made By Rupesh"),
                    Text("Data Provided By Openweathermap.org")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
