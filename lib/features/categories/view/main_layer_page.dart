import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/presntation/view/category_details_view.dart';
import 'package:news_app/features/categories/model/enums/category_enum.dart';
import 'package:news_app/features/categories/view/views/category_view.dart';
import 'package:news_app/features/categories/view/views/home_dreawer.dart';
import 'package:news_app/features/categories/view_model/category_cubit.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});
  static const String routeName = '/mainLayerPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocBuilder<CategoryCubit, CategoryEnum?>(
        builder: (BuildContext context, CategoryEnum? state) {
          return Scaffold(
            drawer: HomeDrawer(),
            appBar: AppBar(
              title: Text(
                state != null ? state.name : 'Home', //TODO:localization
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: state != null ? CategoryDetailsView() : CategoryListView(),
          );
        },
      ),
    );
  }
}
///bloc provider->change notifier provider
///bloc builder->consumer , watch
///bloc listener
///bloc consumer