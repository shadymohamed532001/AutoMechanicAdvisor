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
          padding: EdgeInsets.only(top: 32.h),
          sliver: SliverAppBar(
            expandedHeight: 200.h,
            backgroundColor: Colors.black,
            elevation: 0.0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    'assets/images/car_info_details.png',
                    fit: BoxFit.contain,
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
                    'High temperature',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SingleChildScrollView(
                    child: Text(
                      'Even fuel can leak from your car if the fuel system components are not taken care of. Fuel lines become brittle after time and may crack, while the fittings can also fatigue and damage themselves, although this is less common. The high pressure fuel pump housing can also separate depending on the vehicle you have, but again, this is a rare problem. In unusual cases, the fuel tank may be scratched or damaged by rocks or other road debris, causing a leak here as well. While one can temporarily repair the fuel line with strong solder tape, the pressure of the system will make this a short-term fix, and it is best to simply replace the damaged line. It will also require replacing the faulty pump or tank. It\'s also a good idea to check that you don\'t have an injector stuck open, as it could start your car\'s engine to run incorrectly.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
