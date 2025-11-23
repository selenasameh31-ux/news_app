import 'package:flutter/material.dart';
import 'package:news_app/common/network/apis_service.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/source_mode.dart';
import 'package:news_app/pages/widgets/article_card_widget.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider = Provider.of<CategoryProvider>(context);
    return FutureBuilder<SourceModel?>(
      future: ApisService.getSources(provider.selectedCategory!.name),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Text(asyncSnapshot.error.toString());
        }
        List<Sources> sources = asyncSnapshot.data?.sources ?? [];
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 16),
                // indicatorPadding: EdgeInsetsGeometry.all(0),
                tabAlignment: TabAlignment.start,
                tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources
                      .map((e) => ArticlesList(sourceID: e.id!))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.sourceID});
  final String sourceID;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesModel>(
      future: ApisService.getArticles(sourceID),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        ArticlesModel articlesModel = asyncSnapshot.data!;
        List<Articles> articles = articlesModel.articles ?? [];

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleCardWidget(articles: articles[index]),
        );
      },
    );
  }
}
