import 'package:flutter/material.dart';

//앱 시작 부분
void main() => runApp(MyApp());

//시작 클래스 머티리얼 디자인 앱 생성
class MyApp extends StatelessWidget { //정적인 화면을 가지는 어플리케이션
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCustomForm(), //표시할 화면의 인스턴스
    );
  }
}

// 시작하는 클래스가 실제로 표시한는 클래스, 카운터 앱 화면
class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

//위 MyCustomForm 클래스의 상태를 나타내는 State 클래스
class _MyCustomFormState extends State<MyCustomForm>{
  //Textfield의 현재값을 얻는 데 필요
  final myController = TextEditingController();

  void initState(){
    super.initState();
    //myController가 연결된 두번쟤 Textfield 위젯의 값이
    // 변경될 때마다 addListener 메서드를 사용해 _printLatestValue수행
    myController.addListener(_printLatestValue);
  }

  void dispose(){
    // 화면이 조요될 때는 반드시 위젯 트리에서 컨트롤러를 해제
    myController.dispose();
    super.dispose();
  }
  _printLatestValue(){
    print("두 번째 textfield :${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( //머티리얼 디자인 기본 뼈대 위젯
      appBar: AppBar( // 상단 App Bar
        title: Text("Text Input 연습"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text){ //텍스트 변경 이벤트 감지
                print("첫 번째 textfield:$text");
              },
            ),
            TextField(
              controller: myController,
              // 컨트롤러  프로퍼티에 컨트롤러 변수를 설정하여
              // myControllerfmf xhdgotj TextField 인스턴스의 값을 얻거나 변경된 값을 모니터링 할 수 있다.
            ),
          ],
        ),
      ),
    );
  }
}
