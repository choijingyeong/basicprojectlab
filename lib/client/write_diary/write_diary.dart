import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

final images = [
  'images/movie1.png',
  'images/movie2.png',
  'images/movie3.png',
];

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State createState() => _uploadNewPost();
}

class staticVariables extends ChangeNotifier {
  List<Widget> _tagList = [];

  void addText(String txt) {
    _tagList.add(
        Container(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                  5)),
              color: Colors.grey
          ),
          child: Text(
            "#"+txt,
            style: TextStyle(
                fontSize: 10,
                color: Colors.white
            ),
          ),
        )
    );
  }

}

class _uploadNewPost extends State {
  final tagText = TextEditingController();
  List<Widget> tagList = [
    Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              5)),
          color: Colors.grey
      ),
      child: const Text(
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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.grey
      ),
      child: Text(
        "#영화제",
        style: const TextStyle(
            fontSize: 10,
            color: Colors.white
        ),
      ),
    )
  ];

  void addTag() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text(
              "태그 추가하기",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                child: Text(
                  "추가",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "닫기",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ))
            ],
            content: TextField(
              controller: tagText,
            ),
          );
        },
        context: this.context
    );
  }

  int emotionIndex = 0;
  List emotionArr = [Colors.red, Colors.orange, Colors.yellow, Colors.lightGreenAccent, Colors.lightBlueAccent];
  Container emotionCircle = Container(
    width: 200,
    height: 200,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
      color: Colors.amberAccent,
    ),
  );
  void selectEmotion() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text(
              "감정 변경하기",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "적용",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "닫기",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ))
            ],
            content: Row(
              children: [
                TextButton(
                    onPressed: () {
                      emotionIndex = 0;
                      print(emotionIndex);
                    },
                    child: Text(
                      "화남",
                    )
                ),
                TextButton(
                    onPressed: () {
                      emotionIndex = 1;
                      print(emotionIndex);
                    },
                    child: Text(
                      "신남",
                    )
                ),
                TextButton(
                    onPressed: () {
                      emotionIndex = 2;
                    },
                    child: Text(
                      "기쁨",
                    )
                ),
                TextButton(
                    onPressed: () {
                      emotionIndex = 3;
                    },
                    child: Text(
                      "즐거움",
                    )
                ),
                TextButton(
                    onPressed: () {
                      emotionIndex = 4;
                    },
                    child: Text(
                      "슬픔",
                    )
                ),
              ],
            )
          );
        },
        context: this.context
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        emotionCircle,
                        Container(
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 250.0,
                              ),
                              items: images.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      margin: EdgeInsets.fromLTRB(
                                          10, 40, 10, 0),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10.0,
                                              spreadRadius: 2.0,
                                            )
                                          ]
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                        child: Image.asset(
                                          i,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            )
                        ),
                      ],
                    ),
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: tagList,
                        )
                    )
                  ],
                )
            ),
            Expanded(
                flex: 5,
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
                            TextButton(
                                onPressed: () {
                                  addTag();

                                },
                                child: Text(
                                  "태그추가",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                )
                            ),
                            TextButton(
                                onPressed: () { selectEmotion(); },
                                child: Text(
                                  "감정변경",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                ),),
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

