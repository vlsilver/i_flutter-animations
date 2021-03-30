import 'package:animations/implicit_animtion/example.dart';
import 'package:animations/implicit_animtion/practice.dart';
import 'package:animations/implicit_animtion/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabView { info, example, practice, changeScreen, loadSucces }

class ImplicitAnimation extends StatefulWidget {
  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  var _tabView = TabView.practice;
  var _valueTopAnimatedPosited = 100.0;
  var _valueAnimatedOpacity = 0.0;
  var _isForward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Implicit Animations'),
        ),
        body: Stack(
          children: [
            FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 200)).then((_) {
                  if (_isForward == null) {
                    if (_valueAnimatedOpacity == 0.0) {
                      _valueAnimatedOpacity = 1.0;
                      _valueTopAnimatedPosited = 0.0;
                    } else {
                      _valueAnimatedOpacity = 0.0;
                      _valueTopAnimatedPosited = 100.0;
                    }
                  } else {
                    _valueTopAnimatedPosited = 99.0;
                  }
                  return _isForward == null
                      ? TabView.loadSucces
                      : TabView.changeScreen;
                }),
                initialData: _tabView,
                builder: (context, snap) {
                  if (_tabView == TabView.info) {
                    print('--------Build Info Screen----------');
                    print('_valueAnimatedOpacity $_valueAnimatedOpacity');
                    print('_tabView $_tabView');
                    print('_snap.data ${snap.data}');
                    print('_isForward $_isForward');
                    print('--------Build Info Screen----------\n\n');

                    return AnimatedPositioned(
                      key: ValueKey(0),
                      left: 0,
                      right: 0,
                      top: _valueTopAnimatedPosited,
                      onEnd: () {
                        print('********OnEnd Build Info Screen*******\n\n');
                        if (snap.data == TabView.changeScreen) {
                          _tabView = TabView.example;
                          _isForward = null;
                          setState(() {});
                          print('*******Build Example Screen*****\n\n');
                        }
                      },
                      duration: Duration(milliseconds: 300),
                      child: AnimatedOpacity(
                        opacity: _valueAnimatedOpacity,
                        duration: Duration(milliseconds: 300),
                        child: InfoScreen(
                          changeScreen: (bool isForward) {
                            _changeScreen(isForward);
                          },
                        ),
                      ),
                    );
                  } else if (_tabView == TabView.practice) {
                    print('--------Build Practice Screen----------');
                    print('_valueAnimatedOpacity $_valueAnimatedOpacity');
                    print('_tabView $_tabView');
                    print('_snap.data ${snap.data}');
                    print('_isForward $_isForward');
                    print('--------Build Practice Screen----------\n\n');
                    return AnimatedPositioned(
                      key: ValueKey(1),
                      left: 0,
                      right: 0,
                      duration: Duration(milliseconds: 300),
                      top: _valueTopAnimatedPosited,
                      onEnd: () {
                        if (snap.data == TabView.changeScreen) {
                          _tabView = TabView.example;
                          _isForward = null;
                          setState(() {});
                        }
                      },
                      child: AnimatedOpacity(
                          opacity: _valueAnimatedOpacity,
                          duration: Duration(milliseconds: 300),
                          child: PracticeImplicitScreen(
                            changeScreen: (bool isForward) =>
                                _changeScreen(isForward),
                          )),
                    );
                  } else {
                    print('--------Build Example Screen----------');
                    print('_valueAnimatedOpacity $_valueAnimatedOpacity');
                    print('_tabView $_tabView');
                    print('_snap.data ${snap.data}');
                    print('_isForward $_isForward');
                    print('--------Build Example Screen----------\n\n');
                    return AnimatedPositioned(
                      key: ValueKey(2),
                      left: 0,
                      right: 0,
                      top: _valueTopAnimatedPosited,
                      onEnd: () {
                        if (snap.data == TabView.changeScreen) {
                          _tabView =
                              _isForward ? TabView.practice : TabView.info;
                          _isForward = null;
                          setState(() {});
                        }
                      },
                      duration: Duration(milliseconds: 300),
                      child: AnimatedOpacity(
                        opacity: _valueAnimatedOpacity,
                        duration: Duration(milliseconds: 300),
                        child: ExampleImplicitScreen(
                            changeScreen: (bool isForward) {
                          _changeScreen(isForward);
                        }),
                      ),
                    );
                  }
                }),
          ],
        ));
  }

  void _changeScreen(bool isForward) {
    print('==========Change Screen===============');
    _isForward = isForward;
    _valueAnimatedOpacity = 0.0;
    _valueTopAnimatedPosited = 100.0;
    setState(() {});
    print('==========Change Screen===============\n\n');
  }
}
