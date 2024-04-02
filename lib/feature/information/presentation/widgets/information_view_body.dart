import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/widgets/custom_error_widget.dart';
import 'package:auto_mechanic_advisor/feature/information/logic/information_cubit.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/custom_sliver_appbar.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/see_all_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationViewBody extends StatefulWidget {
  const InformationViewBody({super.key});

  @override
  State<InformationViewBody> createState() => _InformationViewBodyState();
}

class _InformationViewBodyState extends State<InformationViewBody> {
  @override
  void initState() {
    BlocProvider.of<InformationCubit>(context).getInformationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationCubit, InformationState>(
      builder: (context, state) {
        if (state is GetInformationDataLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.redColor,
            ),
          );
        } else if (state is GetInformationDataSuccess) {
          return SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                const CustomSliverAppBar(
                  titleText: 'MECHANIC INFORMATION',
                  centerTitle: false,
                ),
                SliverToBoxAdapter(
                  child: SeeAllItems(
                    information: BlocProvider.of<InformationCubit>(context)
                        .informationResult,
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetInformationDataError) {
          return CustomErrorWidget(
            error: state.error,
            onPressed: () =>
                BlocProvider.of<InformationCubit>(context).getInformationData(),
          );
        } else {
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
