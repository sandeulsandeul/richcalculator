import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
//앱 시작 부분
void main() => runApp(RichApp());

const String testDevice ='YOUR_DEVICE_ID';

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
  // padding 값 설정
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['economy', 'mario'],
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(
        appId: FirebaseAdMob.testAppId
    );
    _bannerAd = createBannerAd()..load();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _housingcostController.dispose();
    _foodcostController.dispose();
    _diginitycostController.dispose();
    _leisurecostController.dispose();
    super.dispose();
  }

  final _minimumPadding = 5.0;
  // 값을 가져오는 각 컨트롤러 인스턴스를 준비
  final _housingcostController = TextEditingController();
  final _foodcostController =  TextEditingController();
  final _diginitycostController =  TextEditingController();
  final _leisurecostController =  TextEditingController();

  get textStyle => null;


  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title :Text('라이프스타일 계산기'),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding *2),
        child: Form(
          key : _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                getImageAsset(),
                Padding(
                  padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: _housingcostController,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return '입력하세요';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: '주거비',
                        hintText: '주거비 e.g. 2000000',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ), // 주거비
                Padding(
                  padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: _foodcostController,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return '입력하세요';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: '식비',
                        hintText: '식비 e.g. 2000000',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ), //식비
                Padding(
                  padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: _diginitycostController,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return '입력하세요';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: '품위유지비',
                        hintText: '품위유지비( 차량유지비, 통신비 .. ) e.g. 2000000',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),//품위유지비
                Padding(
                  padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: _leisurecostController,
                    validator: (value){
                      if(value.trim().isEmpty){
                        return '입력하세요';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: '여가생활비',
                        hintText: '여가생활비 e.g. 2000000',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),//여가생활비
                Padding(
                    padding : EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                              child: Text('계산하기'),
                              onPressed: (){
                                _bannerAd ??= createBannerAd();
                                _bannerAd
                                  ..load()
                                  ..show();
                                if(_formKey.currentState.validate()) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => RichCalculatorResult(
                                          double.parse(_housingcostController.text.trim()),
                                          double.parse(_foodcostController.text.trim()),
                                          double.parse(_diginitycostController.text.trim()),
                                          double.parse(_leisurecostController.text.trim())
                                      )
                                  ),
                                  );
                                }
                              },
                            )
                        ),
                      ],
                    )
                ), //버튼
              ],
            ),
          )
        )
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/그림.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);

    return Container(child: image, margin: EdgeInsets.all(_minimumPadding*5),);
  }
}

class RichCalculatorResult extends StatelessWidget{

  final double housingcost;
  final double foodcost;
  final double diginitycost;
  final double leisurecost;

  RichCalculatorResult(this.housingcost, this.foodcost, this.diginitycost, this.leisurecost);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final result = (housingcost+foodcost+diginitycost+leisurecost)*12*1.622723 .round();

    return Scaffold(
      appBar: AppBar(
        title: Text('부자 계산기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '물가 상승률 2%를 가정하고,',
                style: TextStyle(fontSize: 30),
            ),
            Text(
                  ' 노후자산 인출 4% Rule',
              style: TextStyle(fontSize: 20),
            ),Text(
                  ' 을 적용할 경우에',
              style: TextStyle(fontSize: 20),
            ),Text(
                  ' 당신의 은퇴 후 ',
              style: TextStyle(fontSize: 20),
            ),Text(
              ' 30년 을 위해서는 ',
              style: TextStyle(fontSize: 20),
            ),Text(
              ' $result 원 ',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              ' 이 필요합니다. ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
               height: 16,
            )
          ],
        ),
      ),
    );
  }
}

