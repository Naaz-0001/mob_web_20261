// Flutter 1B

import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //remove Debug banner
      theme: ThemeData(
        // Define the color scheme
        colorScheme: ColorScheme.light(
          primary: Colors.blue, // Replaces primaryColor
          secondary: Colors.pink, // Used for FABs and other secondary elements
        ),
        // Update floatingActionButtonTheme to use colorScheme.secondary
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.pink, // Alternatively: colorScheme.secondary
          foregroundColor: Colors.white, // Text and icon color
        ),
        // Update appBarTheme to use colorScheme.primary
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[600],
          // Darker blue background for AppBar
          titleTextStyle: TextStyle(
            color: Colors.white, // White color for AppBar title text
            fontSize: 20, // Optional: Adjust font size as needed
            fontWeight: FontWeight.bold, // Optional: Make title text bold
          ),
        ),
        scaffoldBackgroundColor: Colors.blue[400], // Scaffold background color
      ),
      home: Scaffold(
        //scaffold has: appBar and body
        //backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
            child: Text(
          'Hello Naaz!',
          style: TextStyle(fontSize: 40, color: Colors.white),
        )),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Approve'),
          icon: Icon(Icons.thumb_up),
          //backgroundColor: Colors.pink,
        ),
      ),
    ),
  );
}