import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';

class ShowVideoOnYoutube extends StatelessWidget {
  const ShowVideoOnYoutube({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Show a video about the property',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 22.h,
        ),
        Row(
          children: [
            Image.asset(
              width: 76.w,
              height: 63.h,
              AppAssets.youtube,
            ),
            SizedBox(
              width: 30.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Watch the video',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'on ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        onEnter: (event) {},
                        text: 'youtube',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
