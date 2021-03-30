import 'package:animations/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

var text1 = 'Bạn chỉ cần cung cấp start value, target value của animation,'
    'phần còn lại cứ để Implicit Widget Animation lo, phần animation chạy bên dưới'
    'như thế nào bào không cần quan tâm!';

var text2 = 'Các tham số của một Implicit Widget Animation:\n'
    '- property widget animation(opacity, height, width, align, ....)\n'
    '- duration: thời gian animation từ start value to target value\n'
    '- curves: đường cong animation theo thời gian';

var text3 =
    '- Khi value of property widget animation "change" và implicit widget "rebuild" thì implicit widget sẽ'
    ' được animated from old value of property to new value focus follow duration.\n'
    '- Khi lần đầu tiên được build thì widget sẽ không có bất kỳ animation nào.\n'
    '- Implicit Widget Animation chỉ có thể sử dụng các property của một StatefulWidget cha để animated.';

var listTextInfo = [
  text1,
  text2,
  text3,
];
var urlMap = <String, String>{
  'List các Implicit Widget Animation':
      'https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html',
  'A collection of common animation curves':
      'https://api.flutter.dev/flutter/animation/Curves-class.html',
  'Codelabs Implicit Animation':
      'https://flutter.dev/docs/codelabs/implicit-animations',
};

var listValueAnimatedOpacity = List<double>.filled(5, 0.0);
var listHeightValueAnimatedContainer = List<double>.filled(4, 0.0);
var listWidthValueAnimatedContainer = List<double>.filled(4, 0.0);
var valueAnimatedAlign = Alignment.center;

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    @required this.changeScreen,
    Key key,
  }) : super(key: key);
  final Function changeScreen;
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var countOnTap = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (countOnTap == 3) {
          countOnTap++;
          valueAnimatedAlign = Alignment.bottomRight;
          listValueAnimatedOpacity[countOnTap] = 1.0;
        } else if (countOnTap < 3) {
          countOnTap++;
          listHeightValueAnimatedContainer[countOnTap] = 150.0;
          listWidthValueAnimatedContainer[countOnTap] =
              MediaQuery.of(context).size.width;
          listValueAnimatedOpacity[countOnTap] = 1.0;
        }
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _createListChildren(),
        ),
      ),
    );
  }

  List<Widget> _createListChildren() {
    var _listResult = <Widget>[];
    for (var i = 0; i < 5; i++) {
      if (i == 3) {
        _listResult.add(CustomFormUrl(index: i));
      } else if (i == 4) {
        _listResult.add(CustomButtonInfo(
            index: i,
            changeScreen: (bool isForward) {
              this.widget.changeScreen(isForward);
            }));
      } else {
        _listResult.add(CustomFormText(index: i));
      }
    }
    return _listResult;
  }
}

class CustomFormText extends StatefulWidget {
  const CustomFormText({
    @required this.index,
  }) : super();
  final int index;

  @override
  _CustomFormTextState createState() => _CustomFormTextState();
}

class _CustomFormTextState extends State<CustomFormText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: listWidthValueAnimatedContainer[this.widget.index],
      height: listHeightValueAnimatedContainer[this.widget.index],
      duration: Duration(milliseconds: 1000),
      child: AnimatedOpacity(
        opacity: listValueAnimatedOpacity[this.widget.index],
        duration: Duration(milliseconds: 1500),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            // height: 80,
            decoration: BoxDecoration(
              color: AppTheme.backgroundContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              listTextInfo[this.widget.index],
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormUrl extends StatefulWidget {
  const CustomFormUrl({@required this.index}) : super();
  final int index;
  @override
  _CustomFormUrlState createState() => _CustomFormUrlState();
}

class _CustomFormUrlState extends State<CustomFormUrl> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: listHeightValueAnimatedContainer[this.widget.index],
      width: listWidthValueAnimatedContainer[this.widget.index],
      duration: Duration(milliseconds: 1000),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 1500),
        opacity: listValueAnimatedOpacity[this.widget.index],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.backgroundContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: FittedBox(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: urlMap.keys.map((key) {
                    return TextButton(
                      onPressed: () async {
                        await _openUrl(urlMap[key]);
                      },
                      child: Text(
                        key,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontFamily: 'Barlow',
                            fontSize: 16),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw "Can't open $url";
  }
}

class CustomButtonInfo extends StatefulWidget {
  const CustomButtonInfo({
    @required this.index,
    @required this.changeScreen,
  }) : super();
  final int index;
  final Function changeScreen;
  @override
  _CustomButtonInfoState createState() => _CustomButtonInfoState();
}

class _CustomButtonInfoState extends State<CustomButtonInfo> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: listValueAnimatedOpacity[this.widget.index],
        duration: Duration(milliseconds: 2000),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: AnimatedAlign(
            alignment: valueAnimatedAlign,
            duration: Duration(milliseconds: 1000),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CupertinoButton(
                  minSize: 0,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                  onPressed: () {
                    this.widget.changeScreen(true);
                  },
                  child: Text(
                    'Example Code',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
