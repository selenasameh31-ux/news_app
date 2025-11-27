
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app/features/articles/data/mapper/articles_mapper.dart';
import 'package:news_app/features/articles/data/models/articles_model.dart';
import 'package:news_app/features/articles/data/models/source_mode.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/domain/repository/articles_repository.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesDataSource _articlesDataSource;

  ArticlesRepositoryImpl({required ArticlesDataSource articlesDataSource})
      : _articlesDataSource = articlesDataSource;

  @override
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId) async {
    try {
      ArticlesModel model = await _articlesDataSource.getArticles(sourceId);
      List<ArticleEntity> articles =
          (model.articles ?? []).map((e) => e.getEntity()).toList();
      return Success<List<ArticleEntity>>(data: articles);
    } on FailureModel catch (e) {
      return Failure(error: e);
    } catch (e) {
      return Failure(error: BaseFailure(errorMEssage: e.toString()));
    }
  }

  @override
  Future<Response<List<SourceEntity>>> getSources(String catId) async {
    try {
      SourceModel sourceModel = await _articlesDataSource.getSources(catId);
      return Success(data: sourceModel.sources ?? []);
    } on FailureModel catch (e) {
      return Failure(error: e);
    }
  }
}