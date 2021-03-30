import 'package:animations/common/theme.dart';
import 'package:animations/implicit_animtion/implicit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i_animation',
      theme: AppTheme.themeData,
      home: MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _animation = 0.0;
  var _implicit = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              _animation = _animation == 0.0
                  ? MediaQuery.of(context).size.height - 50.0
                  : 0.0;
              _implicit = 0.0;
              setState(() {});
            },
            child: AppBar(
              toolbarHeight: 50,
              title: Text(widget.title),
            ),
          ),
          AnimatedContainer(
            height: _animation,
            duration: Duration(milliseconds: 500),
            child: Container(
              color: Colors.red,
            ),
          ),
          GestureDetector(
            onTap: () {
              _implicit = _implicit == 0.0
                  ? MediaQuery.of(context).size.height - 100.0
                  : 0.0;
              _animation = 0.0;
              setState(() {});
            },
            child: AppBar(
              title: Text('Implicit Animations'),
            ),
          ),
          Container(
            height: _implicit,
            child: _implicit == 0 ? Container() : ImplicitAnimation(),
          )
        ],
      ),
    ));
  }
}
