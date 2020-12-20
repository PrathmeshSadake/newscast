import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TopNews extends StatelessWidget {
  final String title;
  final Color color;
  final String imageUrl;

  TopNews({
    @required this.title,
    @required this.color,
    @required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: color,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                width: 160,
                child: Text(
                  title,
                  softWrap: true,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFffffff),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
