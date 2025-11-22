import 'package:flutter/material.dart';
import 'package:news_app/pages/views/category_details_view.dart';
import 'package:news_app/pages/views/category_view.dart';
import 'package:news_app/pages/views/home_dreawer.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});
  static const String routeName = '/mainLayerPage';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: Consumer<CategoryProvider>(
        builder: (BuildContext context, CategoryProvider value, Widget? child) {
          return Scaffold(
            drawer: HomeDrawer(),
            appBar: AppBar(
              title: Text(
                value.selectedCategory != null
                    ? value.selectedCategory!.name
                    : 'Home', //TODO:localization
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: value.selectedCategory != null
                ? CategoryDetailsView()
                : CategoryListView(),
          );
        },
      ),
    );
  }
}
