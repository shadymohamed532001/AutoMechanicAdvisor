import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_image_assets.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/data/mechanic_model.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/logic/cubit/mechanic_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicCard extends StatelessWidget {
  const MechanicCard({
    super.key,
    this.onTap,
    required this.mechanicModel,
  });

  final MechanicModel mechanicModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: ColorManager.greyColor.withOpacity(0.155),
          borderRadius: BorderRadius.all(Radius.circular(
            20.r,
          )),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  top: 5.h,
                  bottom: 5.w,
                  left: 5.w,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(19.r)),
                  child: SizedBox(
                    width: 110.w,
                    height: 80.h,
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl${mechanicModel.image}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 10, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              mechanicModel.name,
                              style: AppStyle.font14Whitesemibold.copyWith(
                                fontFamily: 'Raleway',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Tanta Qism 2, Second Tanta Gharbia Governorate' * 2,
                        style: AppStyle.font14Greymedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          mechanicModel.phoneNumber,
                          style: AppStyle.font14Whitesemibold,
                        ),
                        const SizedBox(width: 7),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<MechanicCubit>(context).launchphone(
                              phoneNumber: mechanicModel.phoneNumber,
                              context: context,
                            );
                          },
                          icon: const Icon(
                            Icons.call,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<MechanicCubit>(context)
                                .launchWhatsApp(
                                    phoneNumber: mechanicModel.phoneNumber,
                                    context: context);
                          },
                          child: Image.asset(
                            ImagesAssetsManager.whatsapp,
                            width: 25.w,
                            height: 25.h,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
