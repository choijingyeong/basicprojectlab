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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "김상담",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "과제 추가",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "과제 제목",
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
                child: Text(
                  "제출 기한",
                  style: TextStyle(
                    fontSize: 17
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "시작 날짜",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "종료 날짜",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "과제 내용",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.black
                        )
                    ),
                  ),
                )
              ),
              Container(
                child: TextButton(
                  onPressed: () {}, ////////////////////////추가하기버튼/////////////////////////////////////
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "추가하기",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              )
            ],
          )),
    );
  }
}
