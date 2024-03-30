import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        final userData = homeCubit.userData;
        if (userData != null && userData.data != null) {
          final fullName = userData.data!.fullName;
          return Column(
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          '$baseUrl${homeCubit.userData!.data!.image}'),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, $fullName',
                          style: AppStyle.font16Whitesemibold.copyWith(
                            fontFamily: 'Raleway',
                          ),
                        ),
                        Text(
                          'Welcome to Auto Mechanic advisor',
                          style: AppStyle.font14Whitesemibold.copyWith(
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
