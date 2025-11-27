import 'package:flutter/material.dart';
import 'package:news_app/common/extention/theme_extention.dart';
import 'package:news_app/features/categories/model/enums/category_enum.dart';
import 'package:news_app/features/categories/view/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '''Good Morning
Here is Some News For You''',
            style: context.getTextTheme.titleMedium!.copyWith(fontSize: 24),
          ),
          ...List.generate(
            CategoryEnum.values.length,
            (index) => CategoryCard(
              categoryEnum: CategoryEnum.values[index],
              isRight: (index % 2 == 0),
            ),
          ),
        ],
      ),
    );
  }
}
