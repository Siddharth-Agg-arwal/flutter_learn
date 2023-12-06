// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  String time = 'Loading...';

  void setUpWorldTime() async{

    WorldTime instance = WorldTime(location: 'Berlin', flag: 'Berlin.png', url: 'Europe/Berlin');
    //print('hello');
    await instance.getTime();
    //print('hello2');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
