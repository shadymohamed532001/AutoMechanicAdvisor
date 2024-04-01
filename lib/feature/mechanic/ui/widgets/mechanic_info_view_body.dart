import 'package:animate_do/animate_do.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/custom_sliver_appbar.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/logic/cubit/mechanic_cubit.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/ui/widgets/mechanic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicInfoViewBody extends StatefulWidget {
  const MechanicInfoViewBody({super.key});

  @override
  State<MechanicInfoViewBody> createState() => _MechanicInfoViewBodyState();
}

class _MechanicInfoViewBodyState extends State<MechanicInfoViewBody> {
  @override
  void initState() {
    BlocProvider.of<MechanicCubit>(context).getMechanic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MechanicCubit, MechanicState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MechanicCubit>(context);
        if (state is GetMechanicDataLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.redColor,
            ),
          );
        } else if (state is GetMechanicDataSuccess &&
            state.mechanicInfo != []) {
          return FadeInUp(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const CustomSliverAppBar(
                  titleText: 'Mechanic Information',
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                    right: 27.w,
                    left: 14.w,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: MechanicCard(
                          mechanicModel: state.mechanicInfo[index],
                        ),
                      ),
                      childCount: state.mechanicInfo.length,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      addSemanticIndexes: false,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetMechanicDataError) {
          return FadeInDown(child: Container());
        } else {
          cubit.getMechanic();
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.redColor,
            ),
          );
        }
      },
    );
  }
}
