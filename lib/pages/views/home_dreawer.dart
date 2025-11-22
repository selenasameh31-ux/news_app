import 'package:flutter/material.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment(0, 0),
            height: 166,
            width: double.infinity,
            child: Text(
              'News App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<CategoryProvider>(
                context,
                listen: false,
              ).emptyCategory();

              Navigator.of(context).pop();
            },
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Go To Home', //TODO:localization
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Divider(endIndent: 16, indent: 16),
        ],
      ),
    );
  }
}
