import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/language_provider.dart';
import '../cache/cache_helper.dart';

class CustomDropdownMenuLanguage extends StatefulWidget{
  @override
  State<CustomDropdownMenuLanguage> createState() => _CustomDropdownMenuLanguageState();
}

class _CustomDropdownMenuLanguageState extends State<CustomDropdownMenuLanguage> {
  String selectedLanguage = "en";
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16,
        vertical: 8
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: BoxBorder.all(
            color: Theme.of(context).cardColor,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButton<String>(
          hint: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          style: Theme.of(context).textTheme.labelMedium,
          dropdownColor: Theme.of(context).primaryColor,
          padding: EdgeInsetsGeometry.symmetric(
              horizontal: 16
          ),
          underline: SizedBox(),
          value: languageProvider.appLanguage,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 32,
            color: Theme.of(context).cardColor,
          ),
          isExpanded: true,
          borderRadius: BorderRadius.circular(16),
          menuWidth: MediaQuery.of(context).size.width*0.65,
          items: [
            DropdownMenuItem(
                value: "en",
                child: Text(
                  AppLocalizations.of(context)!.english,
                ),
            ),
            DropdownMenuItem(
                value: "ar",
                child:  Text(
                    AppLocalizations.of(context)!.arabic,
                ),
            )
          ],
          onChanged: (String? newValue) async {
              selectedLanguage = newValue!;
              languageProvider.changeLanguage(newValue);
              await CacheHelper.setData(key: "language_selected", value: selectedLanguage);
              CacheHelper.getData(key: "language_selected");
              setState(() {

              });
          },
        ),
      ),
    );
  }
}