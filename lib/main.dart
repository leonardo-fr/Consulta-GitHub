import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:app_github/screens/HomeGithub.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenNext()
    )
  );
}

class SplashScreenNext extends StatefulWidget {
  @override
  _SplashScreenNextState createState() => _SplashScreenNextState();
}

class _SplashScreenNextState extends State<SplashScreenNext> {
  @override
  Widget build(BuildContext context) {
    return IntroScreen();
  }
}

Widget IntroScreen(){
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 2,
        gradientBackground: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFF6D13),
            Color(0xffFFFFFF),

          ]
        ),
        navigateAfterSeconds: HomeGithub(),
        loaderColor: Color(0xff060535),
      ),
      Container(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/github_logo_black3.png"),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Image.asset("images/logo_f5.png", scale: 25)
            ],
          )
        ),
      )
    ],
  );
}


