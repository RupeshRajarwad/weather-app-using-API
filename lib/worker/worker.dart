import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class worker{

 



  late String location;

    //constructor
   worker(this.location)
   {
    location=this.location;
   }

  late String temp;
  late String humidity;
  late String airspeed;
  late String description;
  late String main;
  late String icon;


  Future<void> getData() async
 {
  try{
 http.Response response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=abd9ed03186edd45264199a9492a29a1"));
 Map data=jsonDecode(response.body);

 //print(data);
 
 //getting temp and humidity
 Map temp_data=data["main"];
 double getTemp=temp_data["temp"]-273.15;
  String getHumidity= temp_data["humidity"].toString();

// getting speed  
   Map wind=data["wind"];
  double getAirspeed=wind["speed"]/0.27777777777778;
 
// getting description
 List weather_data=data["weather"];
 Map weather_main_data=weather_data[0];
 String getMmaindes=weather_main_data["main"];
 String getDesc=weather_main_data["description"];
 



 temp=getTemp.toString();//C
 humidity =getHumidity;//%

 airspeed =getAirspeed.toString();//km/hr
 description=getDesc;
 main=getMmaindes.toString(); 
icon=weather_main_data["icon"].toString();



  }catch(e){

    
 temp="error occured";
 humidity ="error occured";

 airspeed ="error occured";
 description="error occured";
 main="error occured"; 
 icon="03n";

  }


 }
 

}





