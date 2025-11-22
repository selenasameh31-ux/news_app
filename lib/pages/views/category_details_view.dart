import 'package:flutter/material.dart';
import 'package:news_app/pages/widgets/news_card_widget.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 16),
            // indicatorPadding: EdgeInsetsGeometry.all(0),
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'first'),
              Tab(text: 'sec'),
              Tab(text: 'sec'),
              Tab(text: 'sec'),
              Tab(text: 'sec'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => NewsCardWidget(),
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => NewsCardWidget(),
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => NewsCardWidget(),
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => NewsCardWidget(),
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => NewsCardWidget(),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
