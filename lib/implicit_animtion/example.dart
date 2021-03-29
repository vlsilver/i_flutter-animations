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

var listTeam = <String>['T', 'E', 'A', 'M'];

class ExampleImplicitAnimation extends StatefulWidget {
  @override
  _ExampleImplicitAnimationState createState() =>
      _ExampleImplicitAnimationState();
}

class _ExampleImplicitAnimationState extends State<ExampleImplicitAnimation> {
  var listValueOpecity = List<double>.filled(4, 0.0);
  var opecity = 0.0;
  var isForward;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print('===========');
                print('Build Item $index');
                return FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: index * 500))
                        .then((_) {
                      _animatedOpacity(index);
                      return index;
                    }),
                    initialData: 0,
                    builder: (context, snap) {
                      print('-----------');
                      print(
                          'index-$index valueOpecityIndex-${listValueOpecity[index]}');
                      return CustomAnimatedOpacity(
                        listValueOpecity: listValueOpecity,
                        index: index,
                      );
                    });
              },
              itemCount: listTeam.length,
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
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                            child: Text(
                              listImplicitAnimation[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (isForward != null) {
                                isForward = !isForward;
                              } else {
                                isForward = true;
                              }
                              setState(() {});
                            }),
                      )),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listImplicitAnimation.length ~/ 2,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CupertinoButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                            child: Text(
                              listImplicitAnimation[
                                  index + listImplicitAnimation.length ~/ 2],
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              isForward = !isForward;
                              setState(() {});
                            }),
                      )),
            )
          ],
        ),
      ],
    );
  }

  void _animatedOpacity(int index) {
    if (isForward) {
      listValueOpecity[index] = 1.0;
    } else if (!isForward) {
      listValueOpecity[index] = 0.0;
    }
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
      curve: Curves.easeInCirc,
      duration: Duration(milliseconds: 1000),
      opacity: listValueOpecity[index],
      child: Text(
        listTeam[index],
        style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
      ),
    );
  }
}
