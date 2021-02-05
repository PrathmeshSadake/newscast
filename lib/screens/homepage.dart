import 'package:flutter/material.dart';
import 'package:newscast/providers/news.dart';
import 'package:newscast/screens/top_world_news.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newscast/widgets/categories.dart';
import 'package:newscast/widgets/home.dart';
import 'package:newscast/widgets/search.dart';

import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var date = '2021-02-05T09:41:13+0000';

  @override
  void initState() {
    super.initState();
    // DateTime parsedDate = DateTime.parse(date);
    // var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    // print(formattedDate);
  }

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Categories(),
    Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'NEWSCAST',
            style: GoogleFonts.bioRhyme(
              fontSize: 23,
              fontWeight: FontWeight.w900,
              letterSpacing: 5,
            ),
          ),
          iconTheme: IconThemeData(
            color: Color(0xFFAC7FFC),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.language,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => TopWorldNews(),
                  ),
                );
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: .5,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Color(0xFFAC7FFC),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
                size: 30,
                color: Color(0xFFAC7FFC),
              ),
              label: 'Articles',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xFFAC7FFC),
              ),
              label: 'Search',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
