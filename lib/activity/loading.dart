import 'package:flutter/material.dart';
import 'package:mausam/activity/home.dart';
import 'package:mausam/main.dart';
import 'package:mausam/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String city="Mumbai";
  late String temp;
  late String hum;
  late String airspeed;
  late String des;
  late String main;
  late String icon1;

  void startApp() async {
    worker instance = worker(city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    airspeed = instance.airspeed;
    des = instance.description;
    main = instance.main;
    icon1 =instance.icon;
    Future.delayed(Duration(seconds: 2),(){
        Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "air_speed_value": airspeed,
      "des_value": des,
      "main_value": main,
      "icon1":icon1,
      "city_value":city
    });
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
     startApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // Map search =ModalRoute.of(context)!.settings.arguments as Map;
   // print(search);
  
 
    
    

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/mlogo.png",height: 240,width: 240,),
        Text("Mausam App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.white
          
        ),),
        SizedBox(height: 15,),
        Text("Made By Rupesh",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.white
        ),
        ),
        SizedBox(height: 30,),
        SpinKitWave(
          color: Colors.white,
          size: 30.0,
        )
      ],
    )),
    backgroundColor: Colors.blue[300],
    );
  }
}
