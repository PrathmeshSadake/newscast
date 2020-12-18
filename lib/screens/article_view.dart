import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String content;

  ArticleView(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      this.content});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  // final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Newscast'),
    //     elevation: 0,
    //   ),
    //   body: Container(
    //       child: WebView(
    //         initialUrl: widget.blogUrl,
    //       )),
    // );
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      
                      Image.network(widget.imageUrl),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        height: 40,
                        width: 40,
                        color: Colors.black,
                        child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: null)),
                      Container(
                        margin: EdgeInsets.only(top: 150),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 30.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey,
                          //     offset: Offset(0.0, 1.0), //(x,y)
                          //     blurRadius: 5.0,
                          //   ),
                          //],
                        ),
                        child: Column(
                          children: [
                            Text(widget.title),
                            SizedBox(
                              height: 20,
                            ),
                            Text(widget.desc),
                            SizedBox(
                              height: 20,
                            ),
                            Text(widget.content)
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
