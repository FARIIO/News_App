import 'package:elyoum_elsa2e3/models/category.dart';
import 'package:elyoum_elsa2e3/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'news/category_card_widget.dart';

class CategoryTypes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    List<Category> categoryList = Category.getCategoriesList(isDark: themeProvider.isDark);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Column(
        spacing: 16,
        children: [
          Text(
              "Good Morning,\nHere is Some News For You.",
            style: theme.textTheme.titleMedium,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CategoryCard(category: categoryList[index],index: index,);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16,);
                },
                itemCount: categoryList.length
            ),
          )
        ],
      ),
    );
  }

}