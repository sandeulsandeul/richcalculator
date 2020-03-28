import 'package:flutter/material.dart';

//앱 시작 부분
void main() => runApp(RichApp());

//시작 클래스 머티리얼 디자인 앱 생성
class RichApp extends StatefulWidget {
  @override
  _RichAppState createState() => _RichAppState();
}

class _RichAppState extends State<RichApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title :Text('라이프스타일 계산기'),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '주거 비용',
                hintText: '주거 비용 e.g. 1000000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '식비',
                  hintText: '식비 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '차량 유지 비용',
                  hintText: '차량 유지 비용 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '쇼핑 비용',
                  hintText: '쇼핑 비용 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '여행 비용',
                  hintText: '여행 비용 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '여가생활 비용',
                  hintText: '여가생활 비용 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: '용돈',
                  hintText: '용돈 e.g. 1000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}
/*
// 시작하는 클래스가 실제로 표시한는 클래스, 카운터 앱 화면
class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

//위 MyCustomForm 클래스의 상태를 나타내는 State 클래스
class _MyCustomFormState extends State<MyCustomForm>{
  //Textfield의 현재값을 얻는 데 필요
  final myController = TextEditingController();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( //머티리얼 디자인 기본 뼈대 위젯
      appBar: AppBar( // 상단 App Bar
        title: Text("부자되는 계산기"),
      ),
      body:
        child: Column(
          children: <Widget>[
            Text("모든 금액은 1달 기준으로 입력해주세요"),
            TextField(
              controller: myController,
              onChanged: (num){ //텍스트 변경 이벤트 감지
                print("첫 번째 textfield:$text");
              },
            ),
            TextField(

            ),
          ],
        ),
      ),
    );
  }
}
*/