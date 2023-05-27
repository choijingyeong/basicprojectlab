import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Image(
                  height: 180,
                  width: 180,
                  image: AssetImage("images/offer.png")
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "내담자의 아이디를 입력해주세요",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "내담자 아이디",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: () {}, //////////////////////////////////////내담자 아이디 검색 버튼///////////////////
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      "검색",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),],
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {}, //////////////////////////////검색 취소 버튼 //////////////////////////////////
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.black
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "취소",
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),],
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: TextButton(
                onPressed: () {}, //////////////////////////////메세지 아이콘 클릭//////////////////////////////
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("icons/email.png"),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}