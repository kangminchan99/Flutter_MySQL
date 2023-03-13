import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:kakao_map_flutter/kakao_map_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late KakaoMapController _kakaoMapController;
  // MapPoint _mapPoint = const MapPoint(37, 127);
  // CameraPosition _cameraPosition =
  //     const CameraPosition(target: MapPoint(37, 127), zoom: 5);

  // void onMapCreated(KakaoMapController controller) async {
  //   final MapPoint mapPoint = await controller.getMapCenterPoint();
  //   setState(() {
  //     kakaoMapController = controller;
  //     _mapPoint = mapPoint;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: KakaoMap(
          initLocation: KakaoLatLng(33.450701, 126.570667),
          kakaoApiKey: "0bbb8627599c1198a2cd41317f240032",
          clustererServiceEnable: true,
          onMapCreated: (controller) {
            _kakaoMapController = controller;
          },
          onMapLoaded: () {
            Get.rawSnackbar(
                message: "맵 로드 완료",
                margin: const EdgeInsets.all(8),
                borderRadius: 12.0,
                snackPosition: SnackPosition.TOP);
            _kakaoMapController.setNowLocation();
          },
          onMarkerTouched: (markerLocation, markerIndex) {
            Get.rawSnackbar(
                message: "$markerLocation, $markerIndex",
                margin: const EdgeInsets.all(8),
                borderRadius: 12.0,
                snackPosition: SnackPosition.TOP);
          },
        )),
      ])),
    );
  }
}
