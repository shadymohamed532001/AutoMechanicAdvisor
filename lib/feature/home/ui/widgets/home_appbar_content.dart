import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final userData = homeCubit.userData;
    final fullName = userData?.data!.fullName;
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
                backgroundImage:
                    NetworkImage('$baseUrl${homeCubit.userData!.data!.image}'),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h, left: 6.w),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          title: const Text('Confirmation'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    LocalServices.removeData(key: 'token');
                                    context.navigateAndRemoveUntil(
                                      newRoute: Routes.loginViewsRoute,
                                    );
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/log_out.png',
                    width: 22.w,
                    height: 25.h,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
