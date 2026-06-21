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
    return this;
  }
}

class _$SecurityStorageModule extends _i477.SecurityStorageModule {}

class _$DioModule extends _i977.DioModule {}
