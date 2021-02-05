import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newscast/screens/category_news.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  CategoryItem({
    this.name,
    this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CategoryNewsScreen(
              categoryName: name,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            ),
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            name.toUpperCase(),
            style: GoogleFonts.coustard(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
