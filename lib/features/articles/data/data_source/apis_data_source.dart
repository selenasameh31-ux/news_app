import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/common/network/network_contes.dart';
import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app/features/articles/data/models/articles_model.dart';
import 'package:news_app/features/articles/data/models/source_mode.dart';

@LazySingleton(as: ArticlesDataSource)
class ApisDataSource extends ArticlesDataSource {
  final Dio dio;

  ApisDataSource({required this.dio});

  @override
  Future<SourceModel> getSources(String category) async {
    try {
      Response response = await dio.get(
        NetworkContes.sourcesEndPoint,
        queryParameters: {'apiKey': NetworkContes.apiKey, 'category': category},
      );
      SourceModel sourceModel = SourceModel.fromJson(response.data);
      if (response.statusCode == 200 && sourceModel.status == "ok") {
        return sourceModel;
      } else {
        throw sourceModel.message ?? 'something went wrong';
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkFailure(e);
    } catch (e) {
      throw BaseFailure(errorMEssage: e.toString());
    }
  }

  @override
  Future<ArticlesModel> getArticles(String sourceId) async {
    try {
      Response response = await dio.get(
        NetworkContes.articlesEndPoint,
        queryParameters: {'apiKey': NetworkContes.apiKey, "sources": sourceId},
      );
      ArticlesModel articlesModel = ArticlesModel.fromJson(response.data);
      if (articlesModel.status == 'ok' && response.statusCode == 200) {
        return articlesModel;
      } else {
        throw articlesModel.message ?? 'something went wrong';
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkFailure(e);
    } catch (e) {
      throw BaseFailure(errorMEssage: e.toString());
    }
  }
}