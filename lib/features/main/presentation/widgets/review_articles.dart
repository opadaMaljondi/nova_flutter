import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class ReviewArticles extends StatelessWidget {
  const ReviewArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 21.w),
          child: Text(
            LocaleKeys.reviewArtical.tr(),
            style: Theme.of(context).textTheme.titleSmall,
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
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
