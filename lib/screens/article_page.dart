import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/urlLauncher.dart';

class ArticlePage extends StatelessWidget {
  final String headline;
  final String description;
  final String source;
  final String webUrl;
  final String imageUrl;
  final String date;

  ArticlePage({
    this.headline,
    this.description,
    this.source,
    this.webUrl,
    this.imageUrl,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFAC7FFC)),
        backgroundColor: Color(0xFFF9FAFE),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'NEWSCAST',
          style: GoogleFonts.bioRhyme(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.open_in_browser,
            ),
            onPressed: () => UrlLauncher.launchUrl(webUrl),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/searchScreen.jpg',
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
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
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageUrl,
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeInCurve: Curves.easeIn,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Published on : $date',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: .75,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Source :  $source',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: .75,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () => UrlLauncher.launchUrl(webUrl),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFAC7FFC),
                      ),
                      child: Text(
                        'Read Article',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            letterSpacing: .75,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
