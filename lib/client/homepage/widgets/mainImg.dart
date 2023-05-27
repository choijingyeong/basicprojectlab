import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainImg extends StatefulWidget {
  String path = "";
  mainImg(String path) {
    this.path = path;
  }
  State<StatefulWidget> createState() => _mainImg(path);
}

class _mainImg extends State{
  String path = "";
  _mainImg(String path){
    this.path = path;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(path),
                fit: BoxFit.cover,
              ),
            )
        ),
        Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.5)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 100, 5),
                        child: Text(
                          "2023/05/26",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 100, 10),
                        child: Text(
                          "영화제",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () { showAlert(); },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        "더보기",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    )
                  ),
                )
              ],
            )
        )
      ],
    );
  }
  void showAlert() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            actions: [
              Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black
                      ),
                      child: Text(
                        "입력",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    )
                  )
              )
            ],
            content: Container(
              width: 300,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              width: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            )
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "영화제",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "2023/05/26",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "이 날, 하늘은 무슨 색이었나요?",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
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
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          );
        },
        context: this.context
    );
  }
}