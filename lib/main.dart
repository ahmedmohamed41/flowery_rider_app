import 'package:flowery_rider_app/config/di/di.dart';
import 'package:flowery_rider_app/core/router/app_router.dart';
import 'package:flowery_rider_app/core/router/router_paths.dart';
import 'package:flowery_rider_app/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const FloweryRiderApp());
}

class FloweryRiderApp extends StatelessWidget {
  const FloweryRiderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(
        initialLocation: AppRouterPaths.kProfileView,
      ),

      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
