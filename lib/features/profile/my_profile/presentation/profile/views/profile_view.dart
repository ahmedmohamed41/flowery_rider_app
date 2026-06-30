import 'dart:async';
import 'package:flowery_rider_app/config/%20base_event/base_event.dart';
import 'package:flowery_rider_app/core/theme/app_colors.dart';
import 'package:flowery_rider_app/core/theme/app_test_style.dart';
import 'package:flowery_rider_app/core/widgets/app_messages.dart';
import 'package:flowery_rider_app/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/view_model/cubit/profile_cubit.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/view_model/intent/profile_intent.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/view_model/state/profile_state.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/widgets/custom_profile_empty_state.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/widgets/profile_info_card.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/widgets/profile_menu_tile.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/profile/widgets/profile_photo.dart';
import 'package:flowery_rider_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final StreamSubscription<BaseEvent> _eventSubscription;

  @override
  void initState() {
    super.initState();
    _eventSubscription = context.read<ProfileCubit>().eventStream.listen((
      event,
    ) {
      if (!mounted) return;

      if (event is DisplaySuccess) {
        AppMessages.showSuccess(context, message: event.message);
      } else if (event is DisplayError) {
        AppMessages.showError(context, message: event.message);
      } else if (event is NavigateEvent) {
        context.go(event.routeName);
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(Assets.icons.notification),
              Positioned(
                top: -10,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.errorColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: AppTextStyles.textStyleRegular12.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading && state.data == null) {
            return Center(
              child: SpinKitFadingCircle(
                color: Theme.of(context).colorScheme.primary,
                size: 50,
              ),
            );
          }
          final driver = state.data;
          if (driver == null) {
            return CustomProfileEmptyState(
              onRetry: () => cubit.handleIntent(LoadProfileIntent()),
            );
          }
          return Stack(
            children: [
              RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async {
                  cubit.handleIntent(LoadProfileIntent());
                },
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
                  children: [
                    ProfileInfoCard(
                      leading: ProfilePhoto(photoUrl: driver.photo),
                      title: driver.displayName,
                      subtitles: [driver.email, driver.phone],
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    ProfileInfoCard(
                      title: 'Vehicle info',
                      subtitles: [
                        driver.displayVehicleType,
                        driver.vehicleNumber,
                      ],
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),
                    ProfileMenuTile(
                      icon: SvgPicture.asset(Assets.icons.translateIcon),
                      title: 'Language',
                      trailingText: _languageName(state.languageCode),
                      onTap: () {},
                    ),
                    ProfileMenuTile(
                      icon: SvgPicture.asset(Assets.icons.logoutIcon),
                      title: 'Logout',
                      trailing: SvgPicture.asset(Assets.icons.logoutIcon),
                    ),
                    const SizedBox(height: 180),
                    Center(
                      child: Text(
                        'v 6.3.0 - (446)',
                        style: AppTextStyles.textStyleRegular12.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isLoading && state.data != null)
                Positioned.fill(
                  child: ColoredBox(
                    color: AppColors.loadingBackgroundColor,
                    child: Center(
                      child: SpinKitFadingCircle(
                        color: Theme.of(context).colorScheme.primary,
                        size: 50,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  String _languageName(String languageCode) {
    return languageCode == 'ar' ? 'Arabic' : 'English';
  }
}
