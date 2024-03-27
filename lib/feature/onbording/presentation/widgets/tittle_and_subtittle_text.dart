import 'package:auto_mechanic_advisor/feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TittleAndSubtittleText extends StatelessWidget {
  const TittleAndSubtittleText({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.read<OnboardingCubit>().onboardingPages()[index].title,
          // style: AppStyle.font32BlackBold,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          context.read<OnboardingCubit>().onboardingPages()[index].subtitle,

          // style: AppStyle.font16LightGreymedium,
        ),
      ],
    );
  }
}
