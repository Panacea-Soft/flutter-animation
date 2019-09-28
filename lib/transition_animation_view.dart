import 'package:flutter/material.dart';
import 'package:flutteranimation/route_paths.dart';

class TransitionAnimationViewWidget extends StatefulWidget {
  @override
  _TransitionAnimationViewWidgetState createState() =>
      _TransitionAnimationViewWidgetState();
}

class _TransitionAnimationViewWidgetState
    extends State<TransitionAnimationViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: "Transition",
        child: Container(
          color: Colors.green,
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
                "Transition Animation",
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
              title: "ScaleTransition",
              tag: "ScaleTransition",
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
              title: "RotationTransition",
              tag: "RotationTransition",
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
              title: "SizeTransition",
              tag: "SizeTransition",
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
              title: "FadeTransition",
              tag: "FadeTransition",
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
              title: "RelativeRectTransition",
              tag: "RelativeRectTransition",
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
              title: "ReletivePositionedTransition",
              tag: "ReletivePositionedTransition",
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
              title: "DecoratedBoxTransition",
              tag: "DecoratedBoxTransition",
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
              title: "AlignTransition",
              tag: "AlignTransition",
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
              title: "DefaultTextStyleTransition",
              tag: "DefaultTextStyleTransition",
              onClickCallback: (tag) {
                Navigator.pushNamed(
                    context, RoutePaths.transitionAnimationViewWidget);
              },
            )
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
                    color: Colors.green,
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
