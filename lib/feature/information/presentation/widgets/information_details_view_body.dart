import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationDetailsBody extends StatelessWidget {
  const InformationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 32.h, left: 8.w, right: 8.w),
          sliver: SliverAppBar(
            expandedHeight: 200.h,
            backgroundColor: Colors.black,
            elevation: 0.0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    'https://picsum.photos/id/237/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 5,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: FadeInUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    'Care Instructions',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your care instructions here' * 100,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
