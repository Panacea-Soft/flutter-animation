import 'package:flutter/material.dart';
import 'package:flutteranimation/route_paths.dart';

class ImplicitAnimationViewWidget extends StatefulWidget {
  @override
  _ImplicitAnimationViewWidgetState createState() =>
      _ImplicitAnimationViewWidgetState();
}

class _ImplicitAnimationViewWidgetState
    extends State<ImplicitAnimationViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: "Implicit",
        child: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, left: 20),
              child: Text(
                "Implict Animation",
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Align",
              tag: "AnimatedAlign",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Container",
              tag: "AnimatedContainer",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated CrossFade",
              tag: "AnimatedCrossFade",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Default TextStyle",
              tag: "AnimatedDefaultTextStyle",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Icon",
              tag: "AnimatedIcon",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated List",
              tag: "AnimatedList",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Modal Barrier",
              tag: "AnimatedModalBarrier",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Opacity",
              tag: "AnimatedOpacity",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Padding",
              tag: "AnimatedPadding",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Physical Model",
              tag: "AnimatedPhysicalModel",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Positioned",
              tag: "AnimatedPositioned",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Positioned Directional",
              tag: "AnimatedPositionedDirectional",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Size",
              tag: "AnimatedSize",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Switcher",
              tag: "AnimatedSwitcher",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 12,
            ),
            AnimationCell(
              boxColor: Colors.white,
              title: "Animated Theme",
              tag: "AnimatedTheme",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      )
    ]));
  }
}

class AnimationCell extends StatelessWidget {
  final Color boxColor;
  final String title;
  final String tag;
  final Function onClickCallback;
  const AnimationCell(
      {Key key, this.boxColor, this.title, this.tag, this.onClickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: boxColor.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onClickCallback(tag);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.blur_on,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(fontSize: 16)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
