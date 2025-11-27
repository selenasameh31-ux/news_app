 import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:news_app/features/articles/domain/repository/articles_repository.dart';

@injectable
class GetArticlesUsecase {
  final ArticlesRepository _articlesRepository;

  // Constructor to inject the ArticlesRepository dependency
  GetArticlesUsecase({required ArticlesRepository articlesRepository})
      : _articlesRepository = articlesRepository;

  // Method to get articles from the repository
  Future<Response<List<ArticleEntity>>> call(String sourceId) async {
    return await _articlesRepository.getArticles(sourceId);
  }
}
