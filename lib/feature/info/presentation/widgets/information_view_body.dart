import 'package:auto_mechanic_advisor/feature/info/presentation/widgets/custom_sliver_appbar.dart';
import 'package:auto_mechanic_advisor/feature/info/presentation/widgets/see_all_info.dart';
import 'package:flutter/cupertino.dart';

class InformationViewBody extends StatelessWidget {
  const InformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          CustomSliverAppBar(
            titleText: 'MECHANIC INFORMATION',
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: SeeAllItems(
                // plants: BlocProvider.of<ExplorCubit>(context).plantsresult,
                ),
          ),
        ],
      ),
    );
  }
}
