import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/feature/information/data/models/information_model.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/views/information_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
    required this.informationModel,
  });

  final InformationModel informationModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InformationDetails(
            informationModel: informationModel,
          );
        }));
      },
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
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl${informationModel.image}',
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
                      informationModel.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font14Whitesemibold,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: Text(
                        informationModel.description,
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
