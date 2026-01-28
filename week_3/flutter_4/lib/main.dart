// https://flutteragency.com/how-to-rotate-an-image-using-animation-controller-and-transform/

// Flutter_4

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  // AnimationController _controller
  late AnimationController _controller;

  @override
  void initState() {

    //The super.initState() call invokes the initialization logic of the base State class,
    // which is necessary for the framework to perform essential setup processes.
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: Tween(begin: 0.3, end: 2.0).animate(_controller)
              // this is for BONUS
                ..addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    _controller.reset();
                  }
                }),
              child: Icon(Icons.stars, size: 100.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Start"),
                  onPressed: () => _controller.forward(),
                ),
                SizedBox(width: 30, height:150),
                ElevatedButton(
                  child: Text("Stop"),
                  onPressed: () => _controller.reset(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}