import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/core/widgets/primary_header_continer.dart';
import 'package:auto_mechanic_advisor/feature/home/logic/cubit/home_cubit.dart';
import 'package:auto_mechanic_advisor/feature/home/ui/widgets/home_appbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            PrimaryHeaderContiner(
              height: MediaQuery.of(context).size.height * 0.17,
              child: const SafeArea(
                child: HomeAppBarContent(),
              ),
            ),
            Expanded(
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 24.h,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color(0xFF909996),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 24.h),
                              Text(
                                'Info',
                                style: AppStyle.font16blacksemibold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 24.h,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color(0xFF909996),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 24.h),
                              Text(
                                'Copilot',
                                style: AppStyle.font16blacksemibold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 24.h,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color(0xFF909996),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 24.h),
                              Text(
                                'mechanic information',
                                style: AppStyle.font16blacksemibold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
