import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_v2/features/auth/forget_passoword/presentation/screens/forget_password_screen.dart';
import 'package:movies_v2/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:movies_v2/features/auth/login/presentation/screens/login_screen.dart';
import 'package:movies_v2/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:movies_v2/features/auth/register/presentation/screens/register_screen.dart';
import 'package:movies_v2/features/main_layout/home/presentation/screens/home_screen.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:movies_v2/features/main_layout/on_boarding/screens/on_boarding_screen.dart';
import 'package:movies_v2/features/main_layout/profile/presentation/screens/edit_profile_screen.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';

class RoutesGenerator {

  static Route<dynamic>? getRoute(RouteSettings settings){
    switch(settings.name){

      case Routes.main:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);

      case Routes.movieDetails:
        return MaterialPageRoute(builder: (context) => const MovieDetailsScreen(),settings: settings);

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen(),);

      case Routes.edit:
        return MaterialPageRoute(builder: (context) => const EditProfileScreen(),);
    }
    return null;
  }
}