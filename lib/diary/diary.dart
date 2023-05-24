import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../app_theme.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> with TickerProviderStateMixin {
  List diaries = [
    ['1','images/milky.jpg','images/tips/tips_1_2.png'],
    ['2', 'images/mont.jpg', 'images/tips/tips_2_2.png'],
    ['3', 'images/tower.jpg', 'images/tips/tips_3_2.png'],
    ['4', 'images/tips/tips_4_1.png', 'images/tips/tips_4_2.png']
  ];

  final CarouselController _controller = CarouselController();

  bool multiple = true;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appBar(),
          Expanded(
              child:DefaultTextStyle(
              style: const TextStyle(fontSize: 20.0, color: Colors.black),
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height/2,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0
                ),
                items: List.generate(4, (index) => index++).map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text(
                            diaries[i][1],
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800),
                          ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage(diaries[i][1]),
                                fit:BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      );
                    },
                  );
                }).toList(),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'Remind Diary',
                style: TextStyle(
                  fontSize: 22,
                  color: isLightMode ? AppTheme.darkText : AppTheme.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}