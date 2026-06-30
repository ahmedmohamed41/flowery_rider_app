import 'package:flowery_rider_app/config/di/di.dart';
import 'package:flowery_rider_app/core/router/router_paths.dart';
import 'package:flowery_rider_app/features/auth/presentation/apply/views/apply_success_view.dart';
import 'package:flowery_rider_app/features/auth/presentation/apply/views/apply_view.dart';
import 'package:flowery_rider_app/features/auth/presentation/apply/view_model/cubit/apply_cubit.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/view_model/cubit/profile_cubit.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static GoRouter getRouter({
    String initialLocation = AppRouterPaths.kLoginView,
  }) => GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: initialLocation,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          'AppLocalizations.of(context)!.errorMessage,',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: AppRouterPaths.kApplyView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ApplyCubit>(),
          child: ApplyView(),
        ),
      ),
      GoRoute(
        path: AppRouterPaths.kApplySuccessView,
        builder: (context, state) => const ApplySuccessView(),
      ),
      GoRoute(
        path: AppRouterPaths.kProfileView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
          child: const ProfileView(),
        ),
      ),
    ],
  );
}
