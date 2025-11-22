import 'package:flutter/material.dart';

import 'package:news_app/common/app_theme.dart';
import 'package:news_app/pages/main_layer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {MainLayerPage.routeName: (_) => MainLayerPage()},
      initialRoute: MainLayerPage.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
