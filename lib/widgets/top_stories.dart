import 'package:flutter/material.dart';

import 'package:newscast/widgets/top_news.dart';
import 'package:newscast/widgets/world_news.dart';

class TopStories extends StatelessWidget {
  TopStories({
    @required this.widget,
  });

  final WorldNews widget;

  final List<Color> _colors = [
    Color(0xFF19249f),
    Color(0xFFffba57),
    Color(0xFFa00058),
    Color(0xFFecd000),
    Color(0xFFe69a28),
    Color(0xFF5564ec),
    Color(0xFFfe5612),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
        // color: Color(0xFF393f47),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return TopNews(
              title: widget.articles[index].title,
              color: _colors[index],
              imageUrl: widget.articles[index].urlToImage,
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
