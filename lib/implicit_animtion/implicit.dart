import 'package:animations/implicit_animtion/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var text1 = 'Bạn chỉ cần cung cấp start value, target value của animation,'
    'phần còn lại cứ để Implicit Widget Animation lo, phần animation chạy bên dưới'
    'như thế nào bào không cần quan tâm!';

var text2 = 'Các tham số của một Implicit Widget Animation:\n'
    '- property widget animation(opacity, height, width, align, ....)\n'
    '- duration: thời gian animation từ start value to target value\n'
    '- curves: đường cong animation theo thời gian';

var text3 =
    '- Khi value of property widget animation "change-rebuild" thì implicit widget sẽ'
    ' animated the property from old value to new value focus follow duration.\n'
    '- Khi lần đầu tiên được build thì widget sẽ không có bất kỳ animation nào.\n'
    '- Implicit Widget Animation chỉ có thể animated cho các property của một StatefullWidget cha';

class ImplicitAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Implicit Animations'),
        ),
        body: PageView(
          allowImplicitScrolling: true,
          children: [
            Center(
              child: Column(children: [
                CustomFormText(
                  text: text1,
                ),
                CustomFormText(
                  text: text2,
                ),
                CustomFormText(
                  text: text3,
                ),
              ]),
            ),
            ExampleImplicitAnimation(),
          ],
        ));
  }
}

class CustomFormText extends StatefulWidget {
  const CustomFormText({
    @required this.text,
  }) : super();
  final String text;

  @override
  _CustomFormTextState createState() => _CustomFormTextState();
}

class _CustomFormTextState extends State<CustomFormText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16),
        // height: 80,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          this.widget.text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
