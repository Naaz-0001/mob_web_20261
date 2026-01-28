import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab N1',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _seconds = 0;
  Timer? _timer; // The Timer instance
  bool _isRunning = false;

  void _handleTimer() {
    if (_isRunning) {
    
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    } else {
      
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          _seconds++; 
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Timer:', style: TextStyle(fontSize: 30)),
            Text(
              '$_seconds',
              style: const TextStyle(fontSize: 25, color: Colors.grey),
            ),
        
          ],
        ),
      ),

      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(height: 40.0),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        onPressed: _handleTimer,
        tooltip: _isRunning ? 'Stop' : 'Start',
        child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}