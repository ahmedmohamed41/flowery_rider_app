// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/network/api_interceptor.dart' as _i807;
import '../../features/auth/data/data_sources/remote/api_client/auth_api_client.dart'
    as _i496;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source/auth_remote_data_source_contract.dart'
    as _i883;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i678;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo_contract.dart'
    as _i181;
import '../../features/auth/domain/use_cases/apply_use_case.dart' as _i743;
import '../../features/auth/presentation/apply/view_model/cubit/apply_cubit.dart'
    as _i723;
import '../../features/profile/my_profile/data/data_sources/remote/api_client/profile_api_client.dart'
    as _i704;
import '../../features/profile/my_profile/data/data_sources/remote/profile_remote_data_source/profile_remote_data_source_contract.dart'
    as _i766;
import '../../features/profile/my_profile/data/data_sources/remote/profile_remote_data_source/profile_remote_data_source_impl.dart'
    as _i325;
import '../../features/profile/my_profile/data/repositories/profile_repo_impl.dart'
    as _i821;
import '../../features/profile/my_profile/domain/repositories/profile_repo_contract.dart'
    as _i749;
import '../../features/profile/my_profile/domain/use_cases/edit_profile_use_case.dart'
    as _i327;
import '../../features/profile/my_profile/domain/use_cases/get_logged_driver_data_use_case.dart'
    as _i317;
import '../../features/profile/my_profile/presentation/edit_my_info/view_model/cubit/edit_profile_cubit.dart'
    as _i956;
import '../../features/profile/my_profile/presentation/profile/view_model/cubit/profile_cubit.dart'
    as _i499;
import '../dio/dio_module.dart' as _i977;
import '../security_storage/security_storage.dart' as _i1026;
import '../security_storage/security_storage_module.dart' as _i477;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final securityStorageModule = _$SecurityStorageModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => securityStorageModule.secureStorage,
    );
    gh.lazySingleton<_i1026.SecurityStorage>(
      () => _i1026.SecurityStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i807.ApiInterceptor>(
      () => _i807.ApiInterceptor(gh<_i1026.SecurityStorage>()),
    );
    gh.singleton<_i361.Dio>(() => dioModule.getDio(gh<_i807.ApiInterceptor>()));
    gh.factory<_i496.AuthApiClient>(() => _i496.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i704.ProfileApiClient>(
      () => _i704.ProfileApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i766.ProfileRemoteDataSourceContract>(
      () => _i325.ProfileRemoteDataSourceImpl(gh<_i704.ProfileApiClient>()),
    );
    gh.lazySingleton<_i749.ProfileRepoContract>(
      () => _i821.ProfileRepoImpl(gh<_i766.ProfileRemoteDataSourceContract>()),
    );
    gh.factory<_i883.AuthRemoteDataSourceContract>(
      () => _i678.AuthRemoteDataSourceImpl(gh<_i496.AuthApiClient>()),
    );
    gh.factory<_i317.GetLoggedDriverDataUseCase>(
      () => _i317.GetLoggedDriverDataUseCase(gh<_i749.ProfileRepoContract>()),
    );
    gh.factory<_i327.EditProfileUseCase>(
      () => _i327.EditProfileUseCase(gh<_i749.ProfileRepoContract>()),
    );
    gh.lazySingleton<_i181.AuthRepoContract>(
      () => _i662.AuthRepoImpl(gh<_i883.AuthRemoteDataSourceContract>()),
    );
    gh.factory<_i499.ProfileCubit>(
      () => _i499.ProfileCubit(
        gh<_i317.GetLoggedDriverDataUseCase>(),
        gh<_i1026.SecurityStorage>(),
      ),
    );
    gh.factory<_i743.ApplyUseCase>(
      () => _i743.ApplyUseCase(gh<_i181.AuthRepoContract>()),
    );
    gh.factory<_i956.EditProfileCubit>(
      () => _i956.EditProfileCubit(gh<_i327.EditProfileUseCase>()),
    );
    gh.factory<_i723.ApplyCubit>(
      () => _i723.ApplyCubit(gh<_i743.ApplyUseCase>()),
    );
    return this;
  }
}

class _$SecurityStorageModule extends _i477.SecurityStorageModule {}

class _$DioModule extends _i977.DioModule {}
