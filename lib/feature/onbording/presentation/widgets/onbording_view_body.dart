import 'package:animate_do/animate_do.dart';
import 'package:auto_mechanic_advisor/feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:auto_mechanic_advisor/feature/onbording/presentation/widgets/custom_dot_items.dart';
import 'package:auto_mechanic_advisor/feature/onbording/presentation/widgets/tittle_and_subtittle_text.dart';
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
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.cubit.onboardingPages()[0].imagePath!,
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: TittleAndSubtittleText(index: 0),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDotItems(
                        currnetIndex: 0,
                      ),
                      FadeInRight(
                        duration: const Duration(milliseconds: 700),
                        child: GestureDetector(
                          onTap: () {
                            // widget.cubit.navigateBetweenPages(
                            //   context: context,
                            //   pageController: pageController,
                            // );
                          },
                          child: Text(
                            0 ==
                                    BlocProvider.of<OnboardingCubit>(context)
                                            .onboardingPages()
                                            .length -
                                        1
                                ? 'Get Started Now'
                                : 'Next',
                            // style: AppStyle.font15PrimaryBold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
