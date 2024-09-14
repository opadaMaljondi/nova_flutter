import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class PropertyCarouselSlider extends StatefulWidget {
  const PropertyCarouselSlider({
    super.key,
  });

  @override
  State<PropertyCarouselSlider> createState() => _PropertyCarouselSliderState();
}

class _PropertyCarouselSliderState extends State<PropertyCarouselSlider> {
  late CarouselSliderController controller;
  List<String> items = [
    AppAssets.estate1,
    AppAssets.onboarding1,
    AppAssets.estate1,
    AppAssets.onboarding1,
    AppAssets.estate1,
  ];

  bool isReverse = false;

  @override
  void initState() {
    controller = CarouselSliderController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: items
              .map(
                (assetImage) => Image.asset(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  assetImage,
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 333.h,
            autoPlay: false,
            viewportFraction: 1,
            reverse: isReverse,
            pauseAutoPlayOnTouch: true,
          ),
          carouselController: controller,
        ),
        Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 24.h,
                  start: 24.w,
                ),
                child: PrimaryIconButton(
                  color: const Color(0xffEEF1F3).withOpacity(.75),
                  onPressed: () {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: !context.canPop() ? AppColors.black : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 24.w,
                vertical: 90.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      splashColor: AppColors.materialPrimary.shade600,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        controller.nextPage();
                        setState(() {
                          isReverse = false;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            const Color(0xffEEF1F3).withOpacity(.75),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      splashColor: AppColors.materialPrimary.shade600,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        controller.nextPage();
                        setState(() {
                          isReverse = true;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            const Color(0xffEEF1F3).withOpacity(.75),
                        child: Transform.rotate(
                          angle: 180 * 3.1415927 / 180,
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
