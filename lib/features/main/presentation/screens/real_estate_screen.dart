import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryAppbar(
              title: 'Real estate',
            ),
            Divider(
              thickness: 1,
              color: AppColors.mainGray,
              height: 30.h,
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  width: double.infinity,
                  height: 216.h,
                  fit: BoxFit.fill,
                  AppAssets.estate1,
                ),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 28.w,
                end: 41.w,
              ),
              child: Text(
                'Real estate prices are constantly rising in a new global phenomenon',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
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
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 8.w,
                ).copyWith(
                  top: 8.h,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: const Color(0x0000001C),
                      blurRadius: 30.r,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const YoutubeVideo(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      'Real estate advertising',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 21.w),
              child: Text(
                'Review articles',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 21.w,
                end: 13.w,
              ),
              child: Text(
                'Rental properties can be a steady source of passive income. This option is often preferred by those who are not in a hurry to liquidate their assets and want to benefit from constant cash flow. Landlords can benefit from rental income, which can cover mortgage payments, taxes and maintenance costs, often leaving them with a profit. Additionally, real estate may appreciate in value over time, increasing the owner\'s equity.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 21.w,
                end: 13.w,
              ),
              child: Text(
                'Ultimately, the choice between renting and selling a property should align with your financial goals and personal circumstances, taking into account current market conditions',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({
    super.key,
  });

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: 'FxfDOi5Lem0',
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: YoutubePlayer(
        controller: controller,
        aspectRatio: 1.8,
         
      ),
    );
  }
}
company info, engineering comanies, featured properties, news, realEstate, servicestab