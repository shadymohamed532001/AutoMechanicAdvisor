import 'package:auto_mechanic_advisor/feature/information/data/models/information_model.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as animations;

class SeeAllItems extends StatelessWidget {
  const SeeAllItems({
    super.key,
    required this.information,
  });

  final List<InformationModel> information;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        right: 15.w,
        left: 15.w,
        top: 15.h,
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
          child: animations.FadeInAnimation(
            child: PopularCard(
              informationModel: information[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Container(
        height: 20.h,
      ),
      itemCount: information.length,
    );
  }
}
