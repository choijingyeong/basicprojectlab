import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../app_theme.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> with TickerProviderStateMixin {
  List<Map<String, dynamic>> diaries = [
    {"id": 1, "title": "애니메이션", "imageUrl": "images/movie1.png"},
    {"id": 2, "title": "별 + 산", "imageUrl": "images/movie1.png"},
    {"id": 3, "title": "하늘", "imageUrl": "images/movie1.png"},
    {"id": 4, "title": "구름", "imageUrl": "images/movie1.png"},
    {"id": 5, "title": "캐릭터", "imageUrl": "images/movie1.png"},
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
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                aspectRatio: 0.8,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.85,//사진의 패딩
                enableInfiniteScroll: true, // 무한 반복할지 말지
                autoPlayCurve: Curves.fastOutSlowIn, //진행시 애니메이션
                enlargeCenterPage: true, // 센터에있는 사진을 크게할지 말지
              ),
              items: List.generate(diaries.length, (index) => index++).map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              spreadRadius: 0.5,
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              image: AssetImage(diaries[i]["imageUrl"]),
                              fit:BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal :10,
                                  vertical: 20
                              ),
                              child:Text(
                                diaries[i]["title"],
                                style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w800),
                                ),
                              )
                          )
                        ],
                      )
                    );
                  },
                );
              }).toList(),
            ))
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