import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigation_home_screen.dart';

void main() async {
  // 화면 세로모드로 강제 고정
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REMIND DIARY',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      //   textTheme: AppTheme.textTheme,
      //   platform: TargetPlatform.iOS,
      // ),
      home: NavigationHomeScreen(),
    );
  }
}

// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
//
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
// }
