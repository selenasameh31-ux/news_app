import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app/features/articles/data/models/articles_model.dart';
import 'package:news_app/features/articles/data/models/source_mode.dart';

class FirebaseDataSource extends ArticlesDataSource {
  @override
  Future<ArticlesModel> getArticles(String sourceID) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<SourceModel> getSources(String catId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
