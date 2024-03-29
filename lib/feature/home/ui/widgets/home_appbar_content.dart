import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  'assets/images/User.png',
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, John',
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
  }
}
