import 'package:animations/common/theme.dart';
import 'package:animations/implicit_animtion/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var listImplicitAnimation = <String>[
  'AnimatedOpacity',
  'AnimatedContainer',
  'TweenAnimationBuilder',
  'AnimatedAlign',
  'AnimatedDefaultTextStyle',
  'AnimatedPadding',
  'AnimatedPhysicalModel',
  'AnimatedPositioned',
  'AnimatedPositionedDirectional',
  'AnimatedTheme',
  'AnimatedCrossFade',
  'AnimatedSwitcher',
];

var listActivePractice = <int>[0, 1];

var listTeam = <String>['T', 'E', 'A', 'M'];

class PracticeImplicitScreen extends StatefulWidget {
  const PracticeImplicitScreen({@required this.changeScreen}) : super();

  final Function changeScreen;

  @override
  _PracticeImplicitScreenState createState() => _PracticeImplicitScreenState();
}

class _PracticeImplicitScreenState extends State<PracticeImplicitScreen> {
  var _listValueOpecity = List<double>.filled(4, 0.0);
  var _isOpecity = false;
  var _isContainer = false;
  var _listValueHieghtContainer = List<double>.filled(4, 124.0);
  var _isForward;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(32)),
            height: 160,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: FutureBuilder(
                        future:
                            Future.delayed(Duration(milliseconds: index * 500))
                                .then((_) {
                          if (_isForward) {
                            // Default: null
                            _listValueOpecity[index] = 1.0;
                            _listValueHieghtContainer[index] = 150.0;

                            // Default" [0,0,0,0]
                          } else if (!_isForward) {
                            _listValueOpecity[index] = 0.0;
                            _listValueHieghtContainer[index] = 0.0;
                          }
                          return index;
                        }),
                        initialData: 0,
                        builder: (context, snap) {
                          return _isOpecity
                              ? CustomAnimatedOpacity(
                                  listValueOpecity: _listValueOpecity,
                                  index: index,
                                )
                              : _isContainer
                                  ? CustomAnimatedContainer(
                                      index: index,
                                      listHeight: _listValueHieghtContainer,
                                    )
                                  : Container();
                        }),
                  );
                },
                itemCount: listTeam.length,
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listImplicitAnimation.length ~/ 2,
                    itemBuilder: (context, index) {
                      var _isActive = listActivePractice.contains(index);
                      return TweenAnimationBuilder<Color>(
                        duration: Duration(milliseconds: 2000),
                        tween: ColorTween(
                            begin: AppTheme.backgroundContainer,
                            end: listActivePractice.contains(index)
                                ? Colors.black
                                : AppTheme.backgroundContainer),
                        builder: (_, Color value, Widget __) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CupertinoButton(
                              padding: EdgeInsets.all(0),
                              color: value,
                              borderRadius: BorderRadius.circular(4),
                              child: Text(
                                listImplicitAnimation[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_isActive) {
                                  if (index == 0) {
                                    _isOpecity = true;
                                    _isContainer = false;
                                  }
                                  if (index == 1) {
                                    _isOpecity = false;
                                    _isContainer = true;
                                  }
                                  _isForward =
                                      _isForward != null ? !_isForward : true;
                                  setState(() {});
                                }
                              }),
                        ),
                      );
                    })),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listImplicitAnimation.length ~/ 2,
                    itemBuilder: (context, index) {
                      var _isActive = listActivePractice
                          .contains(index + listImplicitAnimation.length ~/ 2);
                      return TweenAnimationBuilder<Color>(
                        duration: Duration(milliseconds: 2000),
                        tween: ColorTween(
                            begin: AppTheme.backgroundContainer,
                            end: _isActive
                                ? Colors.black
                                : AppTheme.backgroundContainer),
                        builder: (_, Color value, Widget __) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CupertinoButton(
                              padding: EdgeInsets.all(0),
                              color: value,
                              borderRadius: BorderRadius.circular(4),
                              child: Text(
                                listImplicitAnimation[
                                    index + listImplicitAnimation.length ~/ 2],
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_isActive) {
                                  _isForward =
                                      _isForward != null ? !_isForward : true;
                                  setState(() {});
                                }
                              }),
                        ),
                      );
                    })),
          ],
        ),
        FutureBuilder(
          future: Future.delayed(Duration(milliseconds: 500)).then((value) {
            return 1.0;
          }),
          initialData: 0.0,
          builder: (context, snap) => AnimatedOpacity(
            opacity: snap.data,
            duration: Duration(milliseconds: 1000),
            child: CustomButtonPracticeBack(changeScreen: (bool isForward) {
              this.widget.changeScreen(isForward);
            }),
          ),
        ),
      ],
    );
  }
}

class CustomAnimatedOpacity extends StatelessWidget {
  const CustomAnimatedOpacity(
      {Key key, @required this.listValueOpecity, @required this.index})
      : super(key: key);

  final List<double> listValueOpecity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: listValueOpecity[index],
      child: Text(
        listTeam[index], //value: [T,E,A,M]
        style: TextStyle(
            fontSize: 124, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer(
      {Key key, @required this.listHeight, @required this.index})
      : super(key: key);

  final List<double> listHeight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 1000),
      height: listHeight[index],
      child: Text(
        listTeam[index], //value: [T,E,A,M]
        style: TextStyle(
            fontSize: 124, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class CustomButtonPracticeBack extends StatefulWidget {
  const CustomButtonPracticeBack({
    @required this.changeScreen,
  }) : super();

  final Function changeScreen;
  @override
  _CustomButtonPracticeBackState createState() =>
      _CustomButtonPracticeBackState();
}

class _CustomButtonPracticeBackState extends State<CustomButtonPracticeBack> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoButton(
        minSize: 0,
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        onPressed: () {
          this.widget.changeScreen(false);
        },
        child: Text(
          'Example',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
