import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/widgets/primary_header_continer.dart';
import 'package:auto_mechanic_advisor/feature/home/ui/widgets/home_appbar_content.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
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
            child: const Column(
              children: [
                Text('HomeViewBody'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
