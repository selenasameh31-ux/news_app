import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extention/theme_extention.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/features/articles/domain/entities/article_entity.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({super.key, required this.articles});
  final ArticleEntity articles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.getTheme.scaffoldBackgroundColor,
        border: Border.all(color: context.getTheme.colorScheme.primary),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? '',
              width: double.infinity,
              height: 220.h,
              fit: BoxFit.cover,
              //   alignment: Alignment(0, 0),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.broken_image)),
            ),
          ),
          Text(
            articles.title ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: context.getTheme.primaryColor,
            ),
          ),
          Row(
            spacing: 20.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  (articles.description!).length < 100
                      ? (articles.description!)
                      : '${articles.description!.substring(0, 100)}...show more',
                  style: TextStyle(
                    color: Color(0xffA0A0A0),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Text(
                timeago.format(DateTime.parse(articles.publishedAt ?? '')),
                style: TextStyle(
                  color: Color(0xffA0A0A0),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
