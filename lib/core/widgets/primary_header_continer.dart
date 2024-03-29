import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryHeaderContiner extends StatelessWidget {
  const PrimaryHeaderContiner(
      {super.key, required this.child, this.height = 300});
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Container(
        margin: EdgeInsets.zero,
        color: ColorManager.blackColor,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1,
          child: Stack(
            children: [
              Positioned(
                bottom: -20.h,
                right: 0,
                left: 0,
                child: Image.asset(
                  ImagesAssetsManager.linesImage,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
