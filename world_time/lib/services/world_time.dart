import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; //location name for the UI
  late String time;  // The time in that location
  late String flag;  // url to an asset flag icon
  late String url; // location for API endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get data properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      print(datetime);
      print(offset);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      print(now.hour);
      // set the time property
      isDaytime = now.hour > 8 && now.hour < 20 ? true : false;
      time =  DateFormat.jm().format(now);
      print(isDaytime);
      //print(now.hour);

    }
    catch (e) {
      print('Caught Error: $e');
      time = 'Could not get time data';
    }
  }
}
