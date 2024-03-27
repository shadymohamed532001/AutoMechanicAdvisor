import 'package:auto_mechanic_advisor/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.initialRoute:
      //   if (onBording != null) {
      //     if (usertoken != null) {
      //       return MaterialPageRoute(
      //         builder: (context) => BlocProvider(
      //           create: (context) => OnboardingCubit(),
      //           child: const HomeView(),
      //         ),
      //       );
      //     } else {
      //       return MaterialPageRoute(
      //         builder: (context) => BlocProvider(
      //           create: (context) => LoginCubit(),
      //           child: const LoginView(),
      //         ),
      //       );
      //     }
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //         create: (context) => OnboardingCubit(),
      //         child: const OnBordingView(),
      //       ),
      //     );
      //   }

      // case Routes.loginViewsRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => LoginCubit(),
      //       child: const LoginView(),
      //     ),
      //   );

      // case Routes.signUpViewsRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => SignUpCubit(),
      //       child: const SignUpView(),
      //     ),
      //   );

      // case Routes.homeViewsRoute:
      //   return MaterialPageRoute(
      //     builder: ((context) => const HomeView()),
      //   );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('noRouteFounded',
              style: TextStyle(
                fontSize: 28,
                color: ColorManger.blackColor,
              )),
        ),
      ),
    );
  }
}
