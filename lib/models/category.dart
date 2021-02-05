import 'package:flutter/foundation.dart';

class Category extends ChangeNotifier{
  final String name;
  final String imageUrl;

  Category({
    @required this.name,
    @required this.imageUrl,
  });

}
