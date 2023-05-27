import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/mainImg.dart';
import 'widgets/mainButtons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
