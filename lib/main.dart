import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_theme.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/routes_manager/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.main,
        theme: AppTheme.appTheme,
      ),
    );
  }
}
