import 'package:flutter/material.dart';
import 'package:newscast/models/category.dart';

class Categories extends ChangeNotifier {
  final List<Category> categoryList = [
    Category(
        name: 'world',
        imageUrl:
            'https://images.unsplash.com/photo-1502920514313-52581002a659?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1347&q=80.jpg'),
    Category(
        name: 'business',
        imageUrl:
            'https://images.unsplash.com/photo-1573164574572-cb89e39749b4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80.jpg'),
    Category(
        name: 'education',
        imageUrl:
            'https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80.jpg'),
    Category(
        name: 'technology',
        imageUrl:
            'https://images.unsplash.com/photo-1605810230434-7631ac76ec81?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80.jpg'),
    Category(
        name: 'health',
        imageUrl:
            'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1335&q=80.jpg'),
    Category(
        name: 'sports',
        imageUrl:
            'https://images.unsplash.com/photo-1517649763962-0c623066013b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80.jpg'),
  ];
}
