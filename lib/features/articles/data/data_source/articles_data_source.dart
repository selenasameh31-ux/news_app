import 'package:news_app/features/articles/data/models/articles_model.dart';
import 'package:news_app/features/articles/data/models/source_mode.dart';

abstract class ArticlesDataSource {
  Future<ArticlesModel> getArticles(String sourceID);
  Future<SourceModel> getSources(String catId);
}
