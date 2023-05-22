import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../write_diary/write_diary.dart';
import 'after_search.dart';

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> with TickerProviderStateMixin {
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
          InkWell(
            key: ValueKey('Sign Up button'),
            onTap: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => AfterSearch()));
              Navigator.push(context,MaterialPageRoute(builder: (context) => WriteDiary()));
            },
            child: const Padding(
              padding: EdgeInsets.only(top:10, bottom:10, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    '검색하러가기',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded,
                      color: Colors.black),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<bool>(
              future: getData(),
              builder:
                  (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return Wrap(
                    spacing : 8.0,
                    runSpacing: 4.0,
                    children: [
                      '여행',
                      '대학교친구들',
                      '고등학교친구들',
                      '여름',
                      '기초프로젝트랩'
                    ]
                        .map(
                            (String name) => Chip(
                          avatar: CircleAvatar(child : Text("#")),
                          label : Text(name),
                          deleteIcon: Icon(Icons.delete),
                          onDeleted: null
                        )
                    )
                        .toList(),
                  );
                }
              },
            ),
          ),
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
