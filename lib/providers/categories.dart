import 'package:flutter/material.dart';

import '../models/category.dart';

class Categories extends ChangeNotifier {
  final List<Category> categoryList = [
    Category(
      name: 'world',
      imageUrl: 'assets/categories/world.jpg',
    ),
    Category(
      name: 'business',
      imageUrl: 'assets/categories/business.jpg',
    ),
    Category(
      name: 'education',
      imageUrl: 'assets/categories/education.jpg',
    ),
    Category(
      name: 'technology',
      imageUrl: 'assets/categories/technology.jpg',
    ),
    Category(
      name: 'health',
      imageUrl: 'assets/categories/health.jpg',
    ),
    Category(
      name: 'sports',
      imageUrl: 'assets/categories/sports.jpg',
    ),
  ];
}
