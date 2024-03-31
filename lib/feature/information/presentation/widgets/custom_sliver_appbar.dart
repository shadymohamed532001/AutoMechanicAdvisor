import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.leading,
    this.actions,
    this.centerTitle,
    this.arrowBackOnTap,
    this.title,
  });

  final Widget? title;
  final String? titleText;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final void Function()? arrowBackOnTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading ??
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
      backgroundColor: ColorManager.whiteColor.withOpacity(0.3),
      elevation: 0.0,
      actions: actions,
      centerTitle: centerTitle,
      title: titleText != null
          ? Text(
              titleText!,
              style: AppStyle.font14blackmedium,
            )
          : title,
    );
  }
}
