import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/dimensions.dart';
import '../cache/cache_helper.dart';

class CustomDropdownMenuTheme extends StatefulWidget {
  @override
  State<CustomDropdownMenuTheme> createState() => _CustomDropdownMenuThemeState();
}

class _CustomDropdownMenuThemeState extends State<CustomDropdownMenuTheme> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Theme.of(context).cardColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButton<ThemeMode>(
          style: Theme.of(context).textTheme.labelMedium,
          dropdownColor: Theme.of(context).primaryColor,
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          underline: SizedBox(),
          value: themeProvider.appTheme,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 32,
            color: Theme.of(context).cardColor,
          ),
          isExpanded: true,
          borderRadius: BorderRadius.circular(16),
          menuWidth: MediaQuery.of(context).size.width * 0.65,
          items: [
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text("Light",style: Theme.of(context).textTheme.labelMedium,),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text("Dark",style: Theme.of(context).textTheme.labelMedium,),
            ),
          ],
          onChanged: (ThemeMode? newTheme) async {
            if (newTheme == null){
              return;
            }
            themeProvider.changeTheme(newTheme);
            await CacheHelper.setData(
              key: "theme_selected",
              value: newTheme.name,
            );
          },
        ),
      ),
    );
  }
}