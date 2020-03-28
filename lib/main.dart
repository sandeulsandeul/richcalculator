import 'package:flutter/material.dart';

//앱 시작 부분
void main() {
  runApp(
    MaterialApp(
      title : '부자 계산기',
      home : RichApp(),
    )
  );
}

//시작 클래스 머티리얼 디자인 앱 생성
class RichApp extends StatefulWidget {
  @override
  State <StatefulWidget> createState() {
    return _RichAppState();
  }
}

class _RichAppState extends State<RichApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title :Text('라이프스타일 계산기'),
      ),
      body: Container(
        child: Column(

        ),
      ),
    );
  }
}

Widget getImageAsset(){
  AssetImage assetImage = AssetImage('images/그림.png');
  Image image = Image(image: assetImage, width: 125.0, height: 125.0,);

  return Container(child: image,);
}