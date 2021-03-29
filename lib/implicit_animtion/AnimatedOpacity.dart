import 'package:animations/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  _OpacityScreenState createState() => _OpacityScreenState();
}

class _OpacityScreenState extends State<AnimatedOpacityScreen> {
  _OpacityScreenState() : super();

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

  var opecity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Implicit Animations'),
        ),
        body: PageView(
          children: [
            // Center(child: Container(child: Text('Introduce'))),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // var opecity = 0.0;

                        print('Build Item');
                        return FutureBuilder(
                            future: Future.delayed(Duration(seconds: index))
                                .then((_) {
                              return index;
                            }),
                            initialData: -1,
                            builder: (context, snap) {
                              if (snap.data == -1) {
                                return Container();
                              } else {
                                return AnimatedOpacity(
                                  duration: Duration(milliseconds: 2000),
                                  opacity: opecity,
                                  onEnd: () {
                                    opecity = opecity == 0.0 ? 1.0 : 0.0;
                                  },
                                  child: Text(
                                    listTeam[index],
                                    style: TextStyle(
                                        fontSize: 75,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
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
                                      setState(() {
                                        opecity = opecity == 0.0 ? 1.0 : 0.0;
                                      });
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
                                      listImplicitAnimation[index +
                                          listImplicitAnimation.length ~/ 2],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      opecity = opecity == 0.0 ? 1.0 : 0.0;
                                      setState(() {});
                                    }),
                              )),
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
