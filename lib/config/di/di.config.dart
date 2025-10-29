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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../modules/dio_module/dio_module.dart' as _i624;
import '../modules/secure_storage_module/secure_storage_module.dart' as _i235;
import '../modules/shared_preferences_module/shared_preferences_module.dart'
    as _i149;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorge,
    );
    gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
    );
    return this;
  }
}

class _$DioModule extends _i624.DioModule {}

class _$SecureStorageModule extends _i235.SecureStorageModule {}

class _$SharedPreferencesModule extends _i149.SharedPreferencesModule {}
