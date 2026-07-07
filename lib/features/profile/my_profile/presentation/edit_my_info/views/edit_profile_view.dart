import 'dart:async';
import 'package:flowery_rider_app/config/%20base_event/base_event.dart';
import 'package:flowery_rider_app/core/theme/app_colors.dart';
import 'package:flowery_rider_app/core/widgets/app_messages.dart';
import 'package:flowery_rider_app/core/widgets/custom_app_bar.dart';
import 'package:flowery_rider_app/features/profile/my_profile/domain/entities/driver_profile_entity.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/edit_my_info/view_model/cubit/edit_profile_cubit.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/edit_my_info/view_model/intent/edit_profile_intent.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/edit_my_info/view_model/state/edit_profile_state.dart';
import 'package:flowery_rider_app/features/profile/my_profile/presentation/edit_my_info/widgets/gender_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatefulWidget {
  final DriverProfileEntity driver;

  const EditProfileView({super.key, required this.driver});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final StreamSubscription<BaseEvent> _eventSubscription;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late String _gender;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController(text: widget.driver.firstName);
    _lastNameController = TextEditingController(text: widget.driver.lastName);
    _emailController = TextEditingController(text: widget.driver.email);
    _phoneController = TextEditingController(text: widget.driver.phone);
    _gender = widget.driver.gender;

    _eventSubscription = context.read<EditProfileCubit>().eventStream.listen((
      event,
    ) {
      if (!mounted) return;

      if (event is DisplaySuccess) {
        AppMessages.showSuccess(context, message: event.message);
        context.pop(true);
      } else if (event is DisplayError) {
        AppMessages.showError(context, message: event.message);
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(title: 'Edit profile'),
      body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Stack(
            children: [
              Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(widget.driver.photo),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.whiteColor,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.greyColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              labelText: 'First name',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              labelText: 'Last name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixText: '*******',
                        prefixStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 25,
                        ),
                        suffix: InkWell(
                          onTap: () {},
                          child: Text(
                            'change',
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GenderSelectionWidget(
                      selectedGender: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.placeHolderColor,
                        ),
                        onPressed: state.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.handleIntent(
                                    UpdateProfileFieldsIntent(
                                      firstName: _firstNameController.text
                                          .trim(),
                                      lastName: _lastNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      phone: _phoneController.text.trim(),
                                      gender: _gender,
                                    ),
                                  );
                                }
                              },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isLoading)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black12,
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
}
