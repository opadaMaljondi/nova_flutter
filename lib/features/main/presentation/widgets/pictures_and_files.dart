import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/helpers/pickers.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/pick_image_from_gallery_or_camera.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:dotted_border/dotted_border.dart';

class PicturesAndFiles extends StatefulWidget {
  const PicturesAndFiles({super.key});

  @override
  State<PicturesAndFiles> createState() => _PicturesAndFilesState();
}

class _PicturesAndFilesState extends State<PicturesAndFiles> {
  File? panoramaImage;
  List<Widget> items = [];
  File? propertyImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
              Text(
                '  ${LocaleKeys.picturesAndFiles.tr()}  ',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.mainGray,
                    ),
              ),
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            LocaleKeys.picturesOfTheProperty.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            LocaleKeys.pleaseAdd3OrMorePhotos.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.mainGray,
                ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Row(
                  children: List.generate(
                    items.length,
                    (index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 6.w),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16.r),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          LocaleKeys.choseImageFrom.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                PrimaryIconButton(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: Icon(
                                                    Icons.image_outlined,
                                                    size: 35.w,
                                                    color: AppColors.primary,
                                                  ),
                                                  onPressed: () async {
                                                    propertyImage =
                                                        await Pickers.pickImage(
                                                      ImageSource.gallery,
                                                    );
                                                    if (propertyImage != null) {
                                                      items.removeAt(index);
                                                      items[index] = ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.r),
                                                        child: Image.file(
                                                          height: 111.h,
                                                          width: 111.w,
                                                          fit: BoxFit.fill,
                                                          propertyImage!,
                                                        ),
                                                      );
                                                    }
                                                    setState(() {
                                                      GoRouter.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  LocaleKeys.gallery.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                PrimaryIconButton(
                                                  padding: EdgeInsets.all(10.w),
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 35.w,
                                                    color: AppColors.primary,
                                                  ),
                                                  onPressed: () async {
                                                    propertyImage =
                                                        await Pickers.pickImage(
                                                      ImageSource.camera,
                                                    );
                                                    if (propertyImage != null) {
                                                      items[index] = ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.r),
                                                        child: Image.file(
                                                          width: 111.w,
                                                          height: 111.h,
                                                          fit: BoxFit.fill,
                                                          propertyImage!,
                                                        ),
                                                      );
                                                    }
                                                    setState(() {
                                                      GoRouter.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  LocaleKeys.camera.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: items[index],
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      items.add(
                        DottedBorder(
                          color: AppColors.gray,
                          dashPattern: const [6],
                          radius: Radius.circular(11.r),
                          borderType: BorderType.RRect,
                          child: Container(
                            height: 111.h,
                            width: 111.w,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.flip(
                                  flipX: true,
                                  child: Image.asset(
                                    height: 42.h,
                                    width: 42.w,
                                    AppAssets.uploadImagePng,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  LocaleKeys.uploadImage.tr(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  child: DottedBorder(
                    color: AppColors.gray,
                    dashPattern: const [6],
                    radius: Radius.circular(11.r),
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      height: 111.h,
                      width: 111.w,
                      child: Icon(
                        Icons.add,
                        color: AppColors.gray,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            LocaleKeys.add360DegreePhoto.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return PickImageFromGalleryOrCamera(
                    onImagePicked: (file) {
                      panoramaImage = file;
                      setState(() {
                        GoRouter.of(context).pop();
                      });
                    },
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: SizedBox(
                height: 300.h,
                width: 300.w,
                child: PhotoView(
                  basePosition: Alignment.center,
                  minScale: PhotoViewComputedScale.covered,
                  maxScale: PhotoViewComputedScale.covered,
                  initialScale: PhotoViewComputedScale.covered,
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
          SizedBox(
            height: 24.h,
          ),
          Text(
            LocaleKeys.engineeringMap.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 58.h,
            decoration: BoxDecoration(
              color: const Color(0xffD1D8DB).withOpacity(.34),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  width: 25.w,
                  height: 25.h,
                  AppAssets.uploadFile,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  LocaleKeys.uploadFile.tr(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            LocaleKeys.videoLinkOnYuTube.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
