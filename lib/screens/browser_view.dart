import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:newscast/screens/home.dart';

class BrowserView extends StatelessWidget {
  final String blogUrl;
  BrowserView({@required this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Center(
          child: Text(
            'NEWSCAST',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              letterSpacing: 6,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    ModalRoute.withName('/home'));
              },
            ),
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: blogUrl,
        ),
      ),
    );
  }
}
