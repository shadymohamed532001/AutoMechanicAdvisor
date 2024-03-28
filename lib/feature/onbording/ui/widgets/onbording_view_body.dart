import 'package:animate_do/animate_do.dart';
import 'package:auto_mechanic_advisor/feature/onbording/logic/onbording_cubit.dart';
import 'package:auto_mechanic_advisor/shared/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/shared/utils/app_image_assets.dart';
import 'package:auto_mechanic_advisor/shared/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/shared/widgets/app_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });
  final OnboardingCubit cubit;

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImagesAssetsManager.carImage,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'We are here for you',
                          style: AppStyle.font22Whitesemibold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'answers any car-related question and provides detailed information about vehicles and mechanics. Whether you\'re a car enthusiast or novice, CarGenius has you covered with accurate answers and insightful explanations, making every journey a knowledgeable experience.',
                          style: AppStyle.font16Greyregular,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  FadeInRight(
                    child: CustomBottom(
                      textBottomStyle: AppStyle.font16Whitesemibold,
                      onPressed: () {
                        BlocProvider.of<OnboardingCubit>(context)
                            .navigateToAuth(context: context);
                      },
                      backgroundColor: ColorManger.primaryColor,
                      bottomtext: 'Get Started Now',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
