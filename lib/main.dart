import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/cubit/browse_cubit.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart';
import 'package:movies_v2/shared/config/theme/app_theme.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/routes_manager/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<HomeCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<BrowseCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.login,
          theme: AppTheme.appTheme,
        ),
      ),
    );
  }
}
