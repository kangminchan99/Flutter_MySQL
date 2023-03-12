import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_kakao_map/flutter_kakao_map.dart';
import 'package:flutter_kakao_map/kakao_maps_flutter_platform_interface.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late KakaoMapController kakaoMapController;
  MapPoint _mapPoint = const MapPoint(37, 127);
  CameraPosition _cameraPosition =
      const CameraPosition(target: MapPoint(37, 127), zoom: 5);

  void onMapCreated(KakaoMapController controller) async {
    final MapPoint mapPoint = await controller.getMapCenterPoint();
    setState(() {
      kakaoMapController = controller;
      _mapPoint = mapPoint;
    });
  }

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
      body: Center(
        child: KakaoMap(initialCameraPosition: _cameraPosition),
      ),
    );
  }
}
