// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/articles/data/data_source/apis_data_source.dart'
    as _i1044;
import '../../../features/articles/data/data_source/articles_data_source.dart'
    as _i543;
import '../../../features/articles/data/repository_impl/articles_repository_impl.dart'
    as _i147;
import '../../../features/articles/domain/repository/articles_repository.dart'
    as _i411;
import '../../../features/articles/domain/use_case/get_articles_usecase.dart'
    as _i483;
import '../../../features/articles/domain/use_case/get_sources_usecase.dart'
    as _i784;
import '../../../features/articles/presntation/view_model/cubit/articles_cubit.dart'
    as _i6;
import 'dio.module.dart' as _i647;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjectable = _$DioInjectable();
    gh.lazySingleton<_i361.Dio>(() => dioInjectable.dio());
    gh.lazySingleton<_i543.ArticlesDataSource>(
      () => _i1044.ApisDataSource(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i411.ArticlesRepository>(
      () => _i147.ArticlesRepositoryImpl(
        articlesDataSource: gh<_i543.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i483.GetArticlesUsecase>(
      () => _i483.GetArticlesUsecase(
        articlesRepository: gh<_i411.ArticlesRepository>(),
      ),
    );
    gh.factory<_i784.GetSourcesUsecase>(
      () => _i784.GetSourcesUsecase(
        articlesRepository: gh<_i411.ArticlesRepository>(),
      ),
    );
    gh.factoryParam<_i6.ArticlesCubit, bool, dynamic>(
      (isFirst, _) => _i6.ArticlesCubit(
        isFirst,
        gh<_i784.GetSourcesUsecase>(),
        gh<_i483.GetArticlesUsecase>(),
      ),
    );
    return this;
  }
}

class _$DioInjectable extends _i647.DioInjectable {}
