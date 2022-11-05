import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram FLutter',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Text("Let's build Instagram by Fflutter"),
      ),
    );
  }
}
