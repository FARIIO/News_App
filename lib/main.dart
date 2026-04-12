import 'package:elyoum_elsa2e3/l10n/app_localizations.dart';
import 'package:elyoum_elsa2e3/providers/language_provider.dart';
import 'package:elyoum_elsa2e3/providers/theme_provider.dart';
import 'package:elyoum_elsa2e3/screens/home_screen.dart';
import 'package:elyoum_elsa2e3/utils/app_routes.dart';
import 'package:elyoum_elsa2e3/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageProvider(),),
          ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ],
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen : (context) => HomeScreen(),
      },
    );
  }

}