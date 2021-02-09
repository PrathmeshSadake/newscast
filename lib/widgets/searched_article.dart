import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/urlLauncher.dart';

class SearchedArticle extends StatelessWidget {
  final String headline;
  final String source;
  final String webUrl;
  final String date;
  SearchedArticle({this.headline, this.source, this.webUrl, this.date});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlLauncher.launchUrl(webUrl),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 2, 10, 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200], width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.launch,
                  color: Color(0xFFAC7FFC),
                ),
                onPressed: () => UrlLauncher.launchUrl(webUrl)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: .75,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      source,
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: .5,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
