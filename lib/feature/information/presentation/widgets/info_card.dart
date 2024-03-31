import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      // onTap: () => context.navigateTo(
      //   routeName: Routes.plantDetailsViewRoute,
      //   arguments: PlantModelClass(plantModle: plant),
      // ),
      child: Container(
        width: 250.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
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
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    height: 130.h,
                    width: 100.w,
                  ),
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
                      'plant.name',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font14blacksemibold,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Expanded(
                      child: Text(
                        'plant.shortDescriptio ',
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
