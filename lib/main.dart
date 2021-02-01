import 'package:first_proj/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'abrarAltaf - portFolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.teal,
        scaffoldBackgroundColor: Color(0xFF141414),
        backgroundColor: Color(0xFF1B1A1A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontWeight: FontWeight.w500),
          bodyText2: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      home: Wrapper(),
    );
  }
}
