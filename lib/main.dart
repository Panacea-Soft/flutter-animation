import 'package:flutter/material.dart';
import 'package:flutteranimation/explicit_animation_view.dart';
import 'package:flutteranimation/implicit_animation_view.dart';
import 'package:flutteranimation/route_paths.dart';
import 'package:flutteranimation/transition_animation_view.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

const ps_default_font_family = "ProductSans";
const Color ps_wtheme_text__primary_color = const Color(0xff607D8B);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PS Flutter Animation',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            headline: TextStyle(
              color: ps_wtheme_text__primary_color,
              fontFamily: ps_default_font_family,
            ),
            title: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            subtitle: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            subhead: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            body1: TextStyle(
              color: ps_wtheme_text__primary_color,
              fontFamily: ps_default_font_family,
            ),
            body2: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            caption: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            button: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            overline: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            display1: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            display2: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            display3: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
            display4: TextStyle(
                color: ps_wtheme_text__primary_color,
                fontFamily: ps_default_font_family),
          ),
        ),
        routes: {
          '/': (context) => PSHomePage(),
          "${RoutePaths.implicitAnimationViewWidget}": (context) =>
              ImplicitAnimationViewWidget(),
          "${RoutePaths.explicitAnimationViewWidget}": (context) =>
              ExplicitAnimationViewWidget(),
          "${RoutePaths.transitionAnimationViewWidget}": (context) =>
              TransitionAnimationViewWidget()
        });
  }
}

class PSHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new HeaderWidget(),
          SizedBox(height: 30),
          new AnimationTypeCell(
            boxColor: Colors.blue,
            title: "Implicit Animation",
            tag: "Implicit",
            onClickCallback: (tag) {
              Vibration.vibrate(duration: 50);
              Navigator.pushNamed(
                  context, RoutePaths.implicitAnimationViewWidget);
            },
          ),
          SizedBox(height: 20),
          new AnimationTypeCell(
            boxColor: Colors.green,
            title: "Transition Animation",
            tag: "Transition",
            onClickCallback: (tag) {
              Vibration.vibrate(duration: 50);
              Navigator.pushNamed(
                  context, RoutePaths.transitionAnimationViewWidget);
            },
          ),
          SizedBox(height: 20),
          new AnimationTypeCell(
            boxColor: Colors.orange,
            title: "Explicit Animation",
            tag: "Explicit",
            onClickCallback: (tag) {
              Vibration.vibrate(duration: 50);
              Navigator.pushNamed(
                  context, RoutePaths.explicitAnimationViewWidget);
            },
          )
        ],
      ),
    );
  }
}

class AnimationTypeCell extends StatelessWidget {
  final Color boxColor;
  final String title;
  final String tag;
  final Function onClickCallback;
  const AnimationTypeCell(
      {Key key, this.boxColor, this.title, this.tag, this.onClickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: boxColor.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onClickCallback(tag);
            },
            child: Center(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontSize: 16, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: Container(
            width: double.infinity,
            height: 195,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.deepOrange.withOpacity(0.3),
                    offset: Offset(0, 0),
                    blurRadius: 8.0),
              ],
            ),
          ),
          clipper: new WaveClipper(),
        ),
        Container(
          height: 180,
          width: double.infinity,
          margin: EdgeInsets.only(top: 16, left: 30, right: 30),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/ps_logo.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                    color: Colors.white),
                Text(
                  "www.panacea-soft.com",
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.white),
                )
              ]),
        )
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 20;
    while (curXPos < size.width) {
      curXPos += increment;
      path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(5));
    }
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => false;
}
