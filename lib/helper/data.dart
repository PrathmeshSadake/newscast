import 'package:flutter/material.dart';
import '../models/category_model.dart';

List<Category> getCategories() {
  List<Category> myCategories = List<Category>();
  Category categoryModel;

  List<String> _categories = [
    "Business",
    "Entertainment",
    "Technology",
    "General",
    "Sports",
    "Health",
    "Science",
  ];

  List<Color> _colors = [
    Color(0xFF19249f),
    Color(0xFFffba57),
    Color(0xFFa00058),
    Color(0xFFecd000),
    Color(0xFFe69a28),
    Color(0xFF5564ec),
    Color(0xFFf7f7f7),
  ];

  for (var i = 0; i <= 6; i++) {
    categoryModel = Category();
    categoryModel.categoryName = _categories[i];
    categoryModel.color = _colors[i];
    myCategories.add(categoryModel);
  }

  return myCategories;
}
