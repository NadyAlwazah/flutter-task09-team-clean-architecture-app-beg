import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/app_initializer.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  الخاص بالتوكن LocalDataSource  إنشاء ال
  final authLocalDataSource = AuthLocalDataSource();

  //   Initializer إنشاء ال
  final initializer = AppInitializer(authLocalDataSource);

  // تشغيل التهيئة
  await initializer.init();

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
