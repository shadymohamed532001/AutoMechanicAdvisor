import 'package:auto_mechanic_advisor/core/widgets/primary_header_continer.dart';
import 'package:auto_mechanic_advisor/feature/home/logic/cubit/home_cubit.dart';
import 'package:auto_mechanic_advisor/feature/home/ui/widgets/home_appbar_content.dart';
import 'package:auto_mechanic_advisor/feature/home/ui/widgets/home_continer_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              height: MediaQuery.of(context).size.height * 0.175,
              child: const SafeArea(
                child: HomeAppBarContent(),
              ),
            ),
            const HomeContinerAction()
          ],
        );
      },
    );
  }
}
