// import 'package:flutter/material.dart';
// import 'package:news_app/common/error/failure_model.dart';
// import 'package:news_app/features/articles/model/articles_model.dart';
// import 'package:news_app/features/articles/model/source_mode.dart';
// import 'package:news_app/features/articles/repository/articles_repository.dart';

// class ArticlesProvider extends ChangeNotifier {
//   final ArticlesRepository articlesRepository;
//   SourceModel? sources;
//   ArticlesModel? articles;
//   String? sourcesError, articlesError;
//   bool sourcesLoading = false, articlesLoading = false;

//   ArticlesProvider({required this.articlesRepository});
//   getSources(String catName) async {
//     sourcesError = null;
//     sourcesLoading = true;
//     notifyListeners();
//     try {
//       sources = await articlesRepository.getSources(catName);
//     } on FailureModel catch (e) {
//       articlesError = e.errorMEssage;
//     } catch (e) {
//       articlesError = e.toString();
//     }
//     sourcesLoading = false;
//     notifyListeners();
//   }

//   getArticles(String sourceId) async {
//     articlesError = null;
//     articlesLoading = true;
//     notifyListeners();
//     try {
//       articles = await articlesRepository.getArticles(sourceId);
//     } on FailureModel catch (e) {
//       articlesError = e.errorMEssage;
//     } catch (e) {
//       articlesError = e.toString();
//     }
//     articlesLoading = false;
//     notifyListeners();
//   }
// }
