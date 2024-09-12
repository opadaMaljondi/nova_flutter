import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Display3D extends StatefulWidget {
  const Display3D({super.key});

  @override
  State<Display3D> createState() => _Display3DState();
}

class _Display3DState extends State<Display3D> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  StreamSubscription? accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    accelerometerSubscription =
        accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        xOffset = event.x * 40.w;
        // yOffset = event.y * 40;
      });
    });
  }

  @override
  void dispose() {
    accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.display3D.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 9.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: SizedBox(
            height: 480.h,
            width: double.infinity,
            child: Transform.translate(
              offset: Offset(xOffset, yOffset),
              child: PhotoView(
                basePosition: Alignment.center,
                minScale: PhotoViewComputedScale.covered,
                maxScale: PhotoViewComputedScale.covered,
                initialScale: PhotoViewComputedScale.contained,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.white,
                ),
                imageProvider: const AssetImage(
                  AppAssets.river,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
