import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_story.dart';
import 'package:kakaomap/main_view_model.dart';
import 'package:kakaomap/utils/kakao_login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = MainViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ?? - 널값이면 빈값
          Image.network(
              viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
          Text('${viewModel.isLogined}'),
          Center(
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await viewModel.login();
                      setState(() {});
                    },
                    child: const Text('kakaoLogin')),
                ElevatedButton(
                    onPressed: () async {
                      await viewModel.logout();
                    },
                    child: const Text('kakaoLogout'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
