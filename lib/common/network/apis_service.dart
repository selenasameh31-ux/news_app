import 'package:dio/dio.dart';
import 'package:news_app/common/network/network_contes.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/source_mode.dart';

class ApisService {
  static Dio dio = Dio(BaseOptions(baseUrl: NetworkContes.baseUrl));

  static Future<SourceModel?> getSources(String category) async {
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
      throw e.message ?? 'something went wrong';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ArticlesModel> getArticles(String sourceId) async {
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
      throw e.message ?? 'something went wrong';
    } catch (e) {
      throw e.toString();
    }
  }
}
