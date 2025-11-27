import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/service_locator/getit/di.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/presntation/view/widgets/article_card_widget.dart';
import 'package:news_app/features/articles/presntation/view_model/cubit/articles_cubit.dart';
import 'package:news_app/features/articles/presntation/view_model/cubit/articles_state.dart';
import 'package:news_app/features/categories/view_model/category_cubit.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = BlocProvider.of<CategoryCubit>(context);
    return BlocProvider(
      create: (context) =>
          getIt<ArticlesCubit>(param1: true)
            ..getSources(categoryCubit.state!.name),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, ArticlesState state) {
          if (state is GetSourcesLoadingState ||
              state is ArticlesInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSourcesErrorSate) {
            return ErrorView(
              error: state.error,
              onRefresh: () => context.read<ArticlesCubit>().getSources(
                categoryCubit.state!.name,
              ),
            );
          }
          //

          late List<SourceEntity> sources;

          if (state is GetSourcesSuccess) {
            sources = state.sources;
          } else if (state is GetArticlesLoading) {
            sources = state.sources;
          } else if (state is GetArticlesError) {
            sources = state.sources;
          } else if (state is GetArticlesSuccessState) {
            sources = state.sources;
          }
          // = viewModel.sources?;
          return DefaultTabController(
            length: (sources).length,
            child: Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // indicatorPadding: EdgeInsetsGeometry.all(0),
                  tabAlignment: TabAlignment.start,
                  tabs: (sources).map((e) => Tab(text: e.name ?? '')).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: (sources)
                        .map(
                          (e) =>
                              ArticlesList(sourceID: e.id!, sources: sources),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({
    super.key,
    required this.sourceID,
    required this.sources,
  });
  final String sourceID;
  final List<SourceEntity> sources;
  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ArticlesCubit>().getArticles(
        widget.sourceID,
        widget.sources,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is GetArticlesLoading || state is GetSourcesSuccess) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetArticlesError) {
          return ErrorView(
            error: state.error,
            onRefresh: () => context.read<ArticlesCubit>().getArticles(
              widget.sourceID,
              widget.sources,
            ),
          );
        }

        List<ArticleEntity> articles =
            (state as GetArticlesSuccessState).articles;

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesCubit>().getArticles(
              widget.sourceID,
              widget.sources,
            );
          },
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                ArticleCardWidget(articles: articles[index]),
          ),
        );
      },
    );
  }
}

//var
//dynamic
//obj
