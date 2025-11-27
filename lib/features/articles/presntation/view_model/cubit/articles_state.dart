import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';

///sources loading
///sources success
///sources error
///
///articles loading
///articles success
///articles error
abstract class ArticlesState {}

class ArticlesInitialState extends ArticlesState {}

class GetSourcesLoadingState extends ArticlesState {}

class GetSourcesSuccess extends ArticlesState {
  final List<SourceEntity> sources;

  GetSourcesSuccess({required this.sources});
}

class GetSourcesErrorSate extends ArticlesState {
  final String error;

  GetSourcesErrorSate({required this.error});
}

class GetArticlesLoading extends ArticlesState {
  final List<SourceEntity> sources;

  GetArticlesLoading({required this.sources});
}

class GetArticlesSuccessState extends ArticlesState {
  final List<SourceEntity> sources;
  final List<ArticleEntity> articles;

  GetArticlesSuccessState({required this.sources, required this.articles});
}

class GetArticlesError extends ArticlesState {
  final List<SourceEntity> sources;
  final String error;

  GetArticlesError({required this.sources, required this.error});
}
