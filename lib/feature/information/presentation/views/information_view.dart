import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/information_view_body.dart';
import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: InformationViewBody(),
    );
  }
}
