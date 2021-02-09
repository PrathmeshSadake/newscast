import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/searched_article_page.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();
  String _searchWord = "";
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/searchScreen.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'SEARCH FOR NEWS ARTICLES',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.coustard(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: TextField(
              autocorrect: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 32,
                  minWidth: 60,
                ),
                hintText: 'Search News',
                hintStyle: TextStyle(fontSize: 18),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              controller: myController,
              onSubmitted: (value) {
                setState(
                  () {
                    _searchWord = value;
                    print(_searchWord);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            SearchedArticleScreen(searchField: _searchWord),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) =>
                      SearchedArticleScreen(searchField: _searchWord),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFAC7FFC),
              ),
              child: Text(
                'SEARCH',
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
    );
  }
}
