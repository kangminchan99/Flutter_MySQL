import 'package:kakao_flutter_sdk/kakao_flutter_sdk_story.dart';
import 'package:kakaomap/utils/social_login.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
  // 로그인 상태
  bool isLogined = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      // 로그인 성공시 나의 정보를 가져온다.
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
