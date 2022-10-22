import 'package:flutter/material.dart';


class Joachim extends StatefulWidget {
  
  @override
  State<Joachim> createState() => _JoachimState();
}

class _JoachimState extends State<Joachim> {
  bool isLong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hey'),
            ElevatedButton(
              onPressed: () {
                setImages();
                
                setState(() {
                  isLong = !isLong;
                });
              },
              child: Text(isLong ? 'long' : 'short'),
            ),
            ElevatedButton(
              onPressed: _onPressed(context),
              child: Text('open'),
            )
          ],
        ),
      ),
    );
  }

  _onPressed(BuildContext context) {
    Navigator.of(context)
        .push(TransparentRoute(builder: (context) => NewWidget(images)));
  }

  List<String> images = List.generate(
    5,
    (_) => 'http://placeimg.com/100/100/any',
  );

  void setImages() {
    images = List.generate(
      isLong ? 5 : 25,
      (_) => 'http://placeimg.com/100/100/any',
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget(this.images, {Key? key}) : super(key: key);

  final List<String> images;
  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  bool isBig = false;
  bool isStack = false;
  bool isBounsing = true;
  final double topOffset = 200;
  final double miniHandleHeigh = 30;
  double safeAreaPadding = 0;
  double startBigAnimationOffset = 0;
  double startStickyOffset =0;
  double backgroundHeight = 0;
  double get savedAppBarHeigh => safeAreaPadding + kToolbarHeight;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    var media = MediaQuery.of(context);
    safeAreaPadding = media.padding.top;
    startBigAnimationOffset = topOffset - savedAppBarHeigh;
    startStickyOffset = startBigAnimationOffset + 20;
    backgroundHeight = media.size.height - miniHandleHeigh - topOffset;

    var canScroll = !_isImageSizeBiggerThenBottomSheetSize(
      media.size.width,
      media.size.height,
    );

    controller.addListener(
      canScroll ? withoutScrolling : withScrolling,
    );
  }

  void withoutScrolling() {
    var offset = controller.offset;
  if (offset < 0) {
      goOut();
    } else {
      controller.animateTo(
        0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    }
  }

  void withScrolling() {
    var offset = controller.offset;

    if (offset < 0) {
      goOut();
    } else if (offset < startBigAnimationOffset && isBig) {
      setState(() {
        isBig = false;
      });
    } else if (offset > startBigAnimationOffset && !isBig) {
      setState(() {
        isBig = true;
      });
    } else if (offset > startStickyOffset && !isStack) {
      setState(() {
        isStack = true;
      });
    } else if (offset < startStickyOffset && isStack) {
      setState(() {
        isStack = false;
      });
    }

    if (offset < topOffset && !isBounsing) {
      setState(() => isBounsing = true);
    } else if (offset > topOffset && isBounsing) {
      setState(() => isBounsing = false);
    }
  }

  void goOut() {
    controller.dispose();
    Navigator.of(context).pop();
  }

  _isImageSizeBiggerThenBottomSheetSize(
    double screenWidth,
    double screenHeight,
  ) {
    // padding: 10, 3 in row;
    print(screenHeight);

  var itemHeight = (screenWidth - 20) / 3;
        print(itemHeight);

    var gridMaxHeight = screenHeight = topOffset - miniHandleHeigh;
        print(gridMaxHeight);

    return (widget.images.length / 3).floor() * itemHeight > gridMaxHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isStack ? Colors.white : Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              constraints: BoxConstraints(minHeight: backgroundHeight),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          ListView(
            physics:
                isBounsing ? BouncingScrollPhysics() : ClampingScrollPhysics(),
            controller: controller,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: topOffset,
                child: TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: isBig ? 1.0 : 0.0),
                    duration: Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          height: 5,
                          width: 60,
                        ),
                      ),
                    ),
                    builder: (_, number, child) {
                      return Container(
                        height: savedAppBarHeigh * number + miniHandleHeigh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular((1 - number) * 20)),
                          color: Colors.white,
                        ),
                        child: Opacity(opacity: 1 - number, child: child),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height - savedAppBarHeigh),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: getGrid(),
              )
            ],
          ),
          if (isStack)
            _AppBar(
              title: 'Gallery',
            )
        ],
      ),
    );
  }

  Widget getGrid() {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: widget.images.map((url) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
          ),
          child: Image(
            image: NetworkImage(url),
          ),
        );
      }).toList(),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key,required this.title}) : super(key: key);

  final Color backgroundColor = Colors.white;
  final Color color = Colors.grey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        color: backgroundColor,
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: 200,
          child: SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: kToolbarHeight),
              child: AppBar(
                centerTitle: false,
                backgroundColor: backgroundColor,
                iconTheme: IconThemeData(
                  color: color, //change your color here
                ),
                primary: false,
                title: Text(
                  title,
                  style: TextStyle(color: color),
                ),
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.white;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        )),
        child: result,
      ),
    );
  }
}
