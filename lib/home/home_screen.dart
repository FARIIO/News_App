import 'package:elyoum_elsa2e3/home/category_types.dart';
import 'package:elyoum_elsa2e3/home/custom_dropdown_menu_language.dart';
import 'package:elyoum_elsa2e3/home/custom_dropdown_menu_theme.dart';
import 'package:elyoum_elsa2e3/home/drawer_item_widget.dart';
import 'package:elyoum_elsa2e3/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.home,style: theme.textTheme.bodyLarge),
        backgroundColor: Colors.transparent,
        foregroundColor: theme.primaryColor,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: theme.primaryColor,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: theme.cardColor,
              width: double.infinity,
              height: height * 0.2,
              child: Text(
                  "News App",
                style: theme.textTheme.titleLarge,
              ),
            ),
            DrawerItemWidget(title: "Go to Home", icon: Icons.home_filled),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Divider(
                color: theme.cardColor ,
                indent: width * 0.05 ,
                endIndent: width * 0.05 ,
                thickness: 2,),
            ),
            DrawerItemWidget(title: "Language", icon: Icons.language_outlined),
          CustomDropdownMenuLanguage(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Divider(
                color: theme.cardColor ,
                indent: width * 0.05 ,
                endIndent: width * 0.05 ,
                thickness: 2,),
            ),
            DrawerItemWidget(title: "Theme", icon: Icons.format_paint_rounded),
          CustomDropdownMenuTheme(),
          ],
        ),
      ),
      body: CategoryTypes(),
    );
  }

}