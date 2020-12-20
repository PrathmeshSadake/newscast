import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

import 'package:newscast/screens/home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_forward,
              color: Color(0xffeb005b),
            ),
          ),
          body: SafeArea(
            child: Container(
              color: Color(0xFF010101),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      child: Image.asset('assets/images/nlogo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: ColorizeAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          "NEWSCAST",
                        ],
                        speed: Duration(milliseconds: 1000),
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontFamily: "CarterOne",
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 3,
                        ),
                        colors: [
                          Colors.yellow,
                          Colors.pink[300],
                          Colors.blue[900],
                          Colors.deepPurple[900],
                        ],
                        textAlign: TextAlign.start,
                        isRepeatingAnimation: true,
                        repeatForever: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RotateAnimatedTextKit(
                            onTap: () {
                              print("Tap Event");
                            },
                            text: ["The Name You Know.", "The News You Need."],
                            textStyle: TextStyle(
                              fontSize: 22.0,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                            repeatForever: true,
                            isRepeatingAnimation: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
