import 'package:animations/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleImplicitScreen extends StatefulWidget {
  const ExampleImplicitScreen({@required this.changeScreen}) : super();
  final Function changeScreen;

  @override
  _ExampleImplicitScreenState createState() => _ExampleImplicitScreenState();
}

class _ExampleImplicitScreenState extends State<ExampleImplicitScreen> {
  var _listImages = <String>[
    'asset/images/implicit_example_1.png',
    'asset/images/implicit_example_2.png',
  ];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: AppTheme.backgroundContainer,
              ),
              padding: EdgeInsets.all(16),
              child: AnimatedSwitcher(
                
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: GestureDetector(
                  key: ValueKey(index),
                  onTap: () {
                    index = index == 0 ? 1 : 0;
                    setState(() {});
                  },
                  child: ImageCodeForm(
                    images: _listImages[index],
                  ),
                ),
                duration: Duration(milliseconds: 500),
              ),
            ),
          ),
          Row(
            children: [
              FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 500))
                      .then((value) {
                    return 1.0;
                  }),
                  initialData: 0.0,
                  builder: (context, snap) => AnimatedOpacity(
                        opacity: snap.data,
                        duration: Duration(milliseconds: 1000),
                        child: CustomButtonExampleBack(
                          changeScreen: (bool isForward) {
                            this.widget.changeScreen(isForward);
                          },
                        ),
                      )),
              Expanded(child: SizedBox()),
              FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 500))
                      .then((value) {
                    return 1.0;
                  }),
                  initialData: 0.0,
                  builder: (context, snap) => AnimatedOpacity(
                        opacity: snap.data,
                        duration: Duration(milliseconds: 1000),
                        child: CustomButtonExampleForward(
                            changeScreen: (bool isForward) {
                          this.widget.changeScreen(isForward);
                        }),
                      )),
            ],
          )
        ],
      ),
    );
  }
}

class ImageCodeForm extends StatelessWidget {
  const ImageCodeForm({Key key, @required this.images}) : super(key: key);
  final String images;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      images,
    );
  }
}

class CustomButtonExampleForward extends StatefulWidget {
  const CustomButtonExampleForward({
    @required this.changeScreen,
  }) : super();

  final Function changeScreen;
  @override
  _CustomButtonExampleForwardState createState() =>
      _CustomButtonExampleForwardState();
}

class _CustomButtonExampleForwardState
    extends State<CustomButtonExampleForward> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: CupertinoButton(
          minSize: 0,
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
          onPressed: () {
            this.widget.changeScreen(true);
          },
          child: Text(
            'Practice',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CustomButtonExampleBack extends StatefulWidget {
  const CustomButtonExampleBack({
    @required this.changeScreen,
  }) : super();

  final Function changeScreen;
  @override
  _CustomButtonExampleBackState createState() =>
      _CustomButtonExampleBackState();
}

class _CustomButtonExampleBackState extends State<CustomButtonExampleBack> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CupertinoButton(
        minSize: 0,
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        onPressed: () {
          this.widget.changeScreen(false);
        },
        child: Text(
          'Info',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
