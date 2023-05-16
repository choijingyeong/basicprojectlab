import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ThroughClass(title: 'Flutter Demo Home Page'),
    );
  }
}

class ThroughClass extends StatefulWidget {
  const ThroughClass({super.key, required this.title});

  final String title;

  @override
  State createState() => _WriteDiary();
}


class _WriteDiary extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              shape: BoxShape.circle
                          ),
                        ),
                        Positioned(
                            top: 50,
                            child: Text(
                              "사진 업로드 문제있음. 추후 수정 예정",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey
                            ),
                            child: Text(
                              '#성년의 날',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey
                            ),
                            child: Text(
                              '#영화',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "오늘은 영화제에서 영화제를 봤다",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "어바웃 타임은 처음 봤는데 재밌었다.",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "태그추가",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "감정변경",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "저장",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            )
                          ],

                        )
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}