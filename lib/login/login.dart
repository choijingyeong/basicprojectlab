import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 버튼을 누를 때의 동작 구현
            // 예: Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'build/assets/logo.png', // 로고 이미지 경로
              width: 304, // 로고 이미지 가로 크기
            ),
            SizedBox(height: 8),
            Container(
              width: 304, // 화면 가로 크기의 반
              height: 51,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 8),
            Container(
              width: 304, // 화면 가로 크기의 반
              height: 51,
              child :
              TextFormField(
                // 비밀번호 입력 필드 설정
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 304, // 화면 가로 크기의 반
              height: 51,
              child :
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 14, 11, 1), // 배경색을 파란색으로 변경
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  // 로그인 버튼 클릭 시 동작 구현
                  // 예: 로그인 처리 로직 호출
                },
                child: Text('LOGIN'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child : TextButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Color.fromARGB(255, 22, 1, 1),
                    ),
                    onPressed: () {
                      // 비밀번호 찾기 버튼을 누를 때의 동작 구현
                    },
                    child: Text('Forget your ID or Password?'),
                  ),
                ),
                Expanded(
                  child : TextButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Color.fromARGB(255, 6, 0, 0),
                    ),
                    onPressed: () {
                      // 회원가입 버튼을 누를 때의 동작 구현
                    },
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}