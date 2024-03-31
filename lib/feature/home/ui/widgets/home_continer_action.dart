import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_image_assets.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContinerAction extends StatelessWidget {
  const HomeContinerAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Text(
              'Auto Mechanic Advisor',
              style: AppStyle.font16blacksemibold.copyWith(
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'Auto Mechanic Advisor is a mobile app for automotive maintenance, repair, and advice. It offers maintenance reminders, troubleshooting guides, repair tutorials, mechanic finding, appointment scheduling, community forums, and personalized recommendations.',
                style: AppStyle.font12Greymedium.copyWith(
                  fontSize: 12.sp,
                  fontFamily: 'Raleway',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.navigateTo(routeName: Routes.informationViewsRoute);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF909996),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            ImagesAssetsManager.carInfoImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Center(
                              child: Text(
                                'AUTO MECHANIC ADVISOR INFORMATION',
                                style: AppStyle.font14blacksemibold.copyWith(
                                  color: ColorManager.whiteColor,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF909996),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            ImagesAssetsManager.mechanicImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Center(
                              child: Text(
                                'AUTO MECHANIC ADVISOR MECHANIC',
                                style: AppStyle.font14blacksemibold.copyWith(
                                  color: ColorManager.whiteColor,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.navigateTo(routeName: Routes.chatViewsRoute);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF909996),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            ImagesAssetsManager.gptImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Center(
                              child: Text(
                                'AUTO MECHANIC ADVISOR CHAT BOT',
                                style: AppStyle.font14blacksemibold.copyWith(
                                  color: ColorManager.whiteColor,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
