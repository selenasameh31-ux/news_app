 import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/domain/repository/articles_repository.dart';

@injectable
class GetSourcesUsecase {
  final ArticlesRepository _articlesRepository;

  
  GetSourcesUsecase({required ArticlesRepository articlesRepository})
      : _articlesRepository = articlesRepository;

  
  Future<Response<List<SourceEntity>>> call(String catId) async {
    return await _articlesRepository.getSources(catId);
  }
}
