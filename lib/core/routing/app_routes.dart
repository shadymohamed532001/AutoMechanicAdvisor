import 'package:auto_mechanic_advisor/core/helper/helper_const.dart';
import 'package:auto_mechanic_advisor/feature/gpt/presenation/views/chat_screen.dart';
import 'package:auto_mechanic_advisor/feature/home/logic/cubit/home_cubit.dart';

import 'package:auto_mechanic_advisor/feature/home/ui/views/home_view.dart';
import 'package:auto_mechanic_advisor/feature/information/logic/information_cubit.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/views/information_view.dart';
import 'package:auto_mechanic_advisor/feature/login/logic/login_cubit.dart';
import 'package:auto_mechanic_advisor/feature/login/ui/views/login_view.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/logic/cubit/mechanic_cubit.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/ui/views/mechanic_info_view.dart';
import 'package:auto_mechanic_advisor/feature/onbording/logic/onbording_cubit.dart';
import 'package:auto_mechanic_advisor/feature/onbording/ui/views/on_boarding_view.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/ui/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        if (onBording != null) {
          if (usertoken != null) {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => OnboardingCubit(),
                child: const HomeView(),
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => LoginCubit(),
                child: const LoginView(),
              ),
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => OnboardingCubit(),
              child: const OnBordingView(),
            ),
          );
        }

      case Routes.loginViewsRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.signUpViewsRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpView(),
          ),
        );

      case Routes.homeViewsRoute:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
                create: (context) => HomeCubit()..getUserData(),
                child: const HomeView(),
              )),
        );

      case Routes.informationViewsRoute:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
                create: (context) => InformationCubit()..getInformationData(),
                child: const InformationView(),
              )),
        );

      case Routes.chatViewsRoute:
        return MaterialPageRoute(
          builder: ((context) => const ChatView()),
        );
      case Routes.mechanicInfoViewsRoute:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
                create: (context) => MechanicCubit(),
                child: const MechanicInfoView(),
              )),
        );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('noRouteFounded',
              style: TextStyle(
                fontSize: 28,
                color: ColorManager.blackColor,
              )),
        ),
      ),
    );
  }
}
