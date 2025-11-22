import 'package:flutter/material.dart';
import 'package:news_app/common/extention/theme_extention.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryEnum,
    required this.isRight,
  });
  final CategoryEnum categoryEnum;
  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<CategoryProvider>(
        context,
        listen: false,
      ).selectCategory(categoryEnum),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        height: 200,
        alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(categoryEnum.imagePath)),
          borderRadius: BorderRadius.circular(25),
          color: context.getTheme.primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              categoryEnum.name,
              style: context.getTextTheme.displayLarge!.copyWith(
                fontSize: 24,
                color: context.getTheme.colorScheme.secondary,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.getTheme.scaffoldBackgroundColor.withValues(
                  alpha: .5,
                ),
                borderRadius: BorderRadius.circular(84),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isRight)
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 54,
                      width: 54,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: context.getTheme.primaryColor,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 9.0,
                      bottom: 9,
                      right: 8,
                      left: 8,
                    ),
                    child: Text(
                      'View All',
                      style: context.getTextTheme.titleLarge!.copyWith(
                        fontSize: 24,
                      ),
                    ),
                  ),

                  if (isRight)
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: context.getTheme.primaryColor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
