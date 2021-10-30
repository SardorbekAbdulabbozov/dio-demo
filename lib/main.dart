import 'package:dio_retrofit_demo/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          onSecondary: Colors.amber,
          onError: Colors.red,
          primary: Colors.amber,
          onPrimary: Colors.blueGrey.shade700,
          background: Colors.blueGrey.shade900,
          error: Colors.red,
          onBackground: Colors.blueGrey,
          brightness: Brightness.light,
          surface: Colors.blueGrey.shade700,
          secondary: Colors.black87,
          onSurface: Colors.blueGrey,
          secondaryVariant: Colors.black,
          primaryVariant: Colors.amber.shade600,
        ),
        canvasColor: Colors.blueGrey.shade900,
      ),
      home: const FirstScreen(),
    );
  }
}
