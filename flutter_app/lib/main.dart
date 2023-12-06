import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
    home: Home(),
));


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('My first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        ),
        body:

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Expanded(
                flex : 6,
                child: Image.asset('assets/mountains1.jpg')),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.all(30),
                color : Colors.cyan,
                child : const Text('1'),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(30),
                color : Colors.pinkAccent,
                child : const Text('2'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30),
                color : Colors.amber,
                child : const Text('3'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () { },
        backgroundColor: Colors.red[600],
         child: const Text('Click!'),
        ),
    );
  }
}
