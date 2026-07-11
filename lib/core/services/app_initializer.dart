import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';

class AppInitializer {
  final AuthLocalDataSource authLocalDataSource;

  AppInitializer(this.authLocalDataSource);

  Future<void> init() async {
    // قراءة التوكن من التخزين المحلي
    final token = await authLocalDataSource.getAccessToken();

    // تهيئة الراوتر بناءً على حالة تسجيل الدخول
    AppRouter.initRouter(isLoggedIn: token != null);
  }
}
