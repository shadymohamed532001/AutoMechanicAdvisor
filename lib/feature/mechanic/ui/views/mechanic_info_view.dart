import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/ui/widgets/mechanic_info_view_body.dart';
import 'package:flutter/material.dart';

class MechanicInfoView extends StatelessWidget {
  const MechanicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: MechanicInfoViewBody(),
    );
  }
}
