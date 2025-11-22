import 'package:flutter/material.dart';
import 'package:news_app/common/extention/theme_extention.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

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
            child: Image.network(
              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'data',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.getTheme.primaryColor,
            ),
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'data',
                  style: TextStyle(
                    color: Color(0xffA0A0A0),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'data',
                style: TextStyle(
                  color: Color(0xffA0A0A0),
                  fontSize: 12,
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
