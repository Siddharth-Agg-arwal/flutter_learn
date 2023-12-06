import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set bg
     final String bgImage = (data['isDayTime'] ?? true) ? 'day3.png' : 'day3.png';
     print(data['isDaytime']);
     final Color? bgColor = (data['isDayTime'] ?? false) ? Colors.lightBlue[400] : Colors.purple[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed( context , '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          //'isDayTime': result['isDayTime'],
                          'flag' : result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[200],
                    ),
                    label:  Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                    ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style:  const TextStyle(
                        //color: Colors.white,
                        fontSize: 35.0,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style: const TextStyle(
                    //color: Colors.white,
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Text(
                    "Created by : Siddharth Aggarwal\n"
                        "Roll Number : 102203375",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
