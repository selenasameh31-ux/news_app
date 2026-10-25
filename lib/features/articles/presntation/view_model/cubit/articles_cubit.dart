  import'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/domain/use_case/get_articles_usecase.dart';
import 'package:news_app/features/articles/domain/use_case/get_sources_usecase.dart';
import 'package:news_app/features/articles/presntation/view_model/cubit/articles_state.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(
    @factoryParam this.isFirst,
    this._getSourcesUsecase,
    this._getArticlesUsecase,
  ) : super(ArticlesInitialState());

  final bool isFirst;
  final GetSourcesUsecase _getSourcesUsecase;
  final GetArticlesUsecase _getArticlesUsecase;

  Future<void> getSources(String catName) async {
    emit(GetSourcesLoadingState());
    Response<List<SourceEntity>> response = await _getSourcesUsecase(catName);
    switch (response) {
      case Success<List<SourceEntity>>():
        emit(GetSourcesSuccess(sources: response.data));
      case Failure<List<SourceEntity>>():
        emit(GetSourcesErrorSate(error: response.error.toString()));
    }
  }

  Future<void> getArticles(String sourceID, List<SourceEntity> sources) async {
    emit(GetArticlesLoading(sources: sources));
    Response<List<ArticleEntity>> response =
        await _getArticlesUsecase(sourceID);

    switch (response) {
      case Success<List<ArticleEntity>>():
        emit(GetArticlesSuccessState(sources: sources, articles: response.data));
      case Failure<List<ArticleEntity>>():
        emit(GetArticlesError(sources: sources, error: response.error.toString()));
    }
  }
}