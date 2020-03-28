import 'package:flutter/material.dart';

//앱 시작 부분
void main() => runApp(RichApp());

//시작 클래스 머티리얼 디자인 앱 생성
class RichApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '부자 계산기',
      home: RichAppPage(),
    );
  }
}
//시작 ㅡㄹ래스가 실제로 표시하는 클래스, 카운터 앱 화면
class RichAppPage extends StatefulWidget{
  @override
  _RichAppState createState() => _RichAppState();
}
class _RichAppState extends State<RichAppPage>{
  final _minimumPadding = 5.0;

  get textStyle => null;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title :Text('라이프스타일 계산기'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding *2),
        child: Column(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: '주거비',
                    hintText: '주거비 e.g. 2000000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: '식비',
                    hintText: '식비 e.g. 2000000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: '생활비',
                    hintText: '생활비( 차량유지비, 통신비 .. ) e.g. 2000000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: '여가생활비',
                    hintText: '여가생활비 e.g. 2000000',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
                padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                          child: Text('계산하기'),
                          onPressed: (){

                          },)
                    ),
                    Expanded(
                        child: RaisedButton(
                          child: Text('계산하기'),
                          onPressed: (){

                          },)
                    ),
                  ],
                )
            ),
            Padding(
              padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
              child: Text('값'),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/그림.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);

    return Container(child: image, margin: EdgeInsets.all(_minimumPadding*5),);
  }
}

