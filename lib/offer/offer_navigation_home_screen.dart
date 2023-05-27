import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'client_list/client_list.dart';
import 'client_request/client_request.dart';
import 'find_client/find_client.dart';
import 'offer_custom_drawer/drawer_user_controller.dart';
import 'offer_custom_drawer/home_drawer.dart';
import 'offer_user_page/offer_user_page.dart';

// 햄버거 메뉴 클릭 시 나옴
class OfferNavigationHomeScreen extends StatefulWidget {
  const OfferNavigationHomeScreen({super.key});

  @override
  _OfferNavigationHomeScreenState createState() => _OfferNavigationHomeScreenState();
}

class _OfferNavigationHomeScreenState extends State<OfferNavigationHomeScreen> {
  // 변수명 뒤에 ?이 붙은것은 null이 될 수 있다는 의미
  Widget? screenView;
  DrawerIndex? drawerIndex;

  // 이 위젯이 로드될때 필요한 초기화를 진행함.
  @override
  void initState() {
    drawerIndex = DrawerIndex.Clientlist;
    screenView = const ClientList();
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
      // 내담자 리스트
        case DrawerIndex.Clientlist:
          setState(() {
            screenView = const ClientList();
          });
          break;
      // 내담자 요청 리스트
        case DrawerIndex.Clientrequest:
          setState(() {
            // screenView = HelpScreen();
            screenView = const ClientRequest();
          });
          break;
      // 내담자 찾기
        case DrawerIndex.Findclient:
          setState(() {
            // screenView = FeedbackScreen();
            screenView = FindClient();
          });
          break;
      // 마이페이지 (피그마에서 8번 페이지)
        case DrawerIndex.Offeruserpage:
          setState(() {
            // screenView = InviteFriend();
            screenView = const OfferUserPage();
          });
          break;
        default:
          break;
      }
    }
  }
}
