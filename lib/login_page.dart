import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_story.dart';
import 'package:kakaomap/main_page.dart';
import 'package:kakaomap/main_view_model.dart';
import 'package:kakaomap/utils/kakao_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = MainViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {
                      await viewModel.login();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                      setState(() {});
                    },
                    child: Image.asset('assets/kakao.png')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () async {
                      await viewModel.logout();
                      setState(() {});
                    },
                    child: const Text('kakaoLogout'))
              ],
            ),
            Text('${viewModel.isLogined}'),
          ],
        ),
      ),
    );
  }
}
