import 'package:news_app/features/articles/data/models/articles_model.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';

extension ArticlesMapper on Articles {
  ArticleEntity getEntity() => ArticleEntity(
    description: this.description,
    publishedAt: this.publishedAt,
    title: this.title,
    url: this.url,
    urlToImage: this.urlToImage,
  );
}
