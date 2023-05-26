import 'package:reminddiary/tags/tags.dart';
import 'package:reminddiary/userpage/user_page.dart';

import '../app_theme.dart';
import '../calendar/calendar.dart';
import '../custom_drawer/drawer_user_controller.dart';
import '../custom_drawer/home_drawer.dart';
import '../feelings/feelings.dart';
import '../homepage/home_page.dart';
import 'diary.dart';
import 'package:flutter/material.dart';


class DiaryNavigation extends StatefulWidget {
  const DiaryNavigation({super.key});

  @override
  _DiaryNavigationState createState() => _DiaryNavigationState();
}

class _DiaryNavigationState extends State<DiaryNavigation> {
  // 변수명 뒤에 ?이 붙은것은 null이 될 수 있다는 의미
  Widget? screenView;
  DrawerIndex? drawerIndex;

  // 이 위젯이 로드될때 필요한 초기화를 진행함.
  @override
  void initState() {
    drawerIndex = DrawerIndex.Testing;
    screenView = const Diary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
      // 첫 메인페이지 (피그마에서 2번페이지)
        case DrawerIndex.HOME:
          setState(() {
            screenView = const MyHomePage();
          });
          break;
      // 달력 (피그마에서 4번페이지)
        case DrawerIndex.Calendar:
          setState(() {
            // screenView = HelpScreen();
            screenView = const Calendar();
          });
          break;
      // 감정별 모아보기 (피그마에서 3번 페이지)
        case DrawerIndex.Feelings:
          setState(() {
            // screenView = FeedbackScreen();
            screenView = Feelings();
          });
          break;
      // 태그별 모아보기 (피그마에서 5번 페이지)
        case DrawerIndex.Tags:
          setState(() {
            // screenView = InviteFriend();
            screenView = const Tags();
          });
          break;
      // 마이페이지 (피그마에서 8번 페이지)
        case DrawerIndex.User:
          setState(() {
            // screenView = InviteFriend();
            screenView = const UserPage();
          });
          break;
        default:
          break;
      }
    }
  }
}
