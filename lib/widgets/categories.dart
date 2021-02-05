import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart' as Cat;
import './category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Consumer<Cat.Categories>(
        builder: (ctx, categories, child) => ListView.builder(
          itemCount: categories.categoryList.length,
          itemBuilder: (ctx, index) => CategoryItem(
            name: categories.categoryList[index].name,
            imageUrl: categories.categoryList[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
