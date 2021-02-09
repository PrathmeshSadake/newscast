import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/article_page.dart';

class ArticleItem extends StatelessWidget {
  final String headline;
  final String description;
  final String source;
  final String webUrl;
  final String imageUrl;
  final String date;

  ArticleItem({
    this.headline,
    this.description,
    this.source,
    this.webUrl,
    this.imageUrl,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ArticlePage(
              headline: headline,
              description: description,
              source: source,
              imageUrl: imageUrl,
              webUrl: webUrl,
              date: date,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 8,
        ),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          children: [
            imageUrl != null
                ? Container(
                    margin: EdgeInsets.only(bottom: 4),
                    height: 180,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imageUrl,
                        fadeInDuration: const Duration(milliseconds: 100),
                        fadeInCurve: Curves.easeIn,
                        fit: BoxFit.cover,
                      ),
                    ))
                : Container(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            source,
                            softWrap: true,
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                letterSpacing: .75,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        // Spacer(),
                        Expanded(
                          flex: 1,
                          child: Text(
                            date,
                            softWrap: true,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                letterSpacing: .75,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
