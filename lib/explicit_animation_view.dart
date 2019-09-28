import 'package:flutter/material.dart';
import 'package:flutteranimation/route_paths.dart';

class ExplicitAnimationViewWidget extends StatefulWidget {
  @override
  _ExplicitAnimationViewWidgetState createState() =>
      _ExplicitAnimationViewWidgetState();
}

class _ExplicitAnimationViewWidgetState
    extends State<ExplicitAnimationViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: "Explicit",
        child: Container(
          color: Colors.orange,
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
                "Explicit Animation",
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
              title: "AnimationBuilder",
              tag: "AnimationBuilder",
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
                    color: Colors.orange,
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
