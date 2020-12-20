import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:newscast/screens/browser_view.dart';
import 'package:newscast/screens/home.dart';

class ArticleView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String url;

  ArticleView({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
    @required this.url,
  });

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
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Image.asset(
                  'assets/images/article_view.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 150),
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageUrl,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          desc,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => BrowserView(
                                blogUrl: url,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.indigo[900],
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Text(
                            'Read More',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
