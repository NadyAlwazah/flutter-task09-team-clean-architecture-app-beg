import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/app/routes.dart';
import 'core/utils/app_colors.dart';
import 'features/favourite/presentation/managers/favorite_provider.dart';
import 'core/utils/shared_prefs_helper.dart'; // إذا كنت تستخدمه لفحص حالة الدخول

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // bool isLoggedIn = await SharedPrefsHelper.checkLoggedInStatus();
  bool isLoggedIn = false;

  AppRouter.initRouter(isLoggedIn: isLoggedIn);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoriteProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Byte Boutique',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          // ربط محرك التوجيه بالراوتر المهيأ في ملف AppRouter
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
