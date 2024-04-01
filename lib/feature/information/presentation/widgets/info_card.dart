import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.informationDetailsViewsRoute,
        // arguments: PlantModelClass(plantModle: plant),
      ),
      child: Container(
        width: 280.w,
        height: 130.h,
        decoration: BoxDecoration(
          color: ColorManager.greyColor.withOpacity(0.188),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/car_info_details.png',
                    height: 130.h,
                    width: 100.w,
                    fit: BoxFit.contain,
                  ),

                  // TODO: add image
                  // child: CachedNetworkImage(
                  //   imageUrl: 'https://picsum.photos/250?image=9',
                  //   height: 130.h,
                  //   width: 100.w,
                  // ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fuel leaks',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font14Whitesemibold,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: Text(
                        'Even fuel can leak from your car if the fuel system components are not taken care of. Fuel lines become rittle after time and may crack, while the fittings can also fatigue and damage themselves, although this is less common.The high pressure fuel pump housing can also separate depending on the vehicle you have, but again, this is a rare problem. In unusual cases, the fuel tank may be scratched or damaged by rocks',
                        style: AppStyle.font12Greymedium,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
