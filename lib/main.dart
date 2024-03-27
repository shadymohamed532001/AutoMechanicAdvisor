import 'package:auto_mechanic_advisor/bloc_observer.dart.dart';
import 'package:auto_mechanic_advisor/shared/helper/helper_const.dart';
import 'package:auto_mechanic_advisor/shared/networking/api_services.dart';
import 'package:auto_mechanic_advisor/shared/networking/local_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.init();
  fetchDataFromLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
