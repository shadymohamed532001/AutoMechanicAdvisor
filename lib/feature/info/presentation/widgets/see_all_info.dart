import 'package:auto_mechanic_advisor/feature/info/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as animations;

//
class SeeAllItems extends StatelessWidget {
  const SeeAllItems({
    super.key,
  });

  // final List<PlantModle> plants;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        right: 20.w,
        left: 20.w,
        top: 27.h,
        bottom: 10.h,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          animations.AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 700),
        child: animations.SlideAnimation(
          horizontalOffset: -150.w,
          curve: Curves.fastLinearToSlowEaseIn,
          child: const animations.FadeInAnimation(child: PopularCard()),
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        height: 35.h,
      ),
      itemCount: 20,
    );
  }
}
