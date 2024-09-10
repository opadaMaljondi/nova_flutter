import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewArticles extends StatelessWidget {
  const ReviewArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 21.w),
          child: Text(
            'Review articles',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 21.w,
            end: 13.w,
          ),
          child: Text(
            'Real estate prices are constantly rising in a new global phenomenon. Real estate prices are constantly rising in a new global phenomenon. Real estate prices are constantly rising in a new global phenomenon',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}