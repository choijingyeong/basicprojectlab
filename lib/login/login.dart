// 참고 https://cholol.tistory.com/572

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model_auth.dart';
import 'model_login.dart';

final TextEditingController _emailController = TextEditingController(); //입력되는 값을 제어
final TextEditingController _passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png', // 로고 이미지 경로
                width: 304, // 로고 이미지 가로 크기
              ),
              SizedBox(height: 8),
              EmailInput(),
              SizedBox(height: 8),
              PasswordInput(),
              SizedBox(height: 16),
              SizedBox(height: 8),
              LoginButton(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              RegisterButton(),
            ],
          ),
        ));
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
          controller: _emailController,
        onChanged: (email) {
          login.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'email',
          helperText: '',
        ),
        validator: (String? value){
          if (value!.isEmpty) {// == null or isEmpty
            return '이메일을 입력해주세요.';
          }
          return null;
        },
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        onChanged: (password) {
          login.setPassword(password);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'password',
          helperText: '',
        ),
        validator: (String? value){
          if (value!.isEmpty) {// == null or isEmpty
            return '비밀번호를 입력해주세요.';
          }
          return null;
        }
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
    Provider.of<FirebaseAuthProvider>(context, listen: false);
    final login = Provider.of<LoginModel>(context, listen: false);

    return Container(
      width: 304, // 화면 가로 크기의 반
      height: 51,
      child : ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Color.fromARGB(255, 14, 11, 1), // 배경색을 파란색으로 변경
          onPrimary: Colors.white,
        ),
        onPressed: () async {
          await authClient
              .loginWithEmail(login.email, login.password)
              .then((loginStatus) {
            if (loginStatus == AuthStatus.loginSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content:
                    Text('welcome! ' + authClient.user!.email! + ' ')));
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('login fail')));
            }
          });
        },
        child: Text('LOGIN'),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/login');
        },
        child: Text(
          'Regist by email',
        ));
  }
}