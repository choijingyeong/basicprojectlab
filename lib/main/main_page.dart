import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminddiary/main/widgets/mainImg.dart';

import 'widgets/mainButtons.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          Expanded(
            flex: 3,
            child: mainImg('images/movie1.png'),
          ),
          Expanded(
            flex: 7,
            child: mainButton(),
          )
        ],
      ),
    );
  }
}
