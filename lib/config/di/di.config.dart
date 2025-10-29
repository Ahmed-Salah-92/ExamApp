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

import '../../features/auth/login/api/api_client/auth_login_api_client.dart'
    as _i214;
import '../../features/auth/login/api/datasource/remote/auth_login_remote_datasource_impl.dart'
    as _i165;
import '../../features/auth/login/data/datasource/remote/auth_login_remote_datasource_contract.dart'
    as _i612;
import '../../features/auth/login/data/repo/auth_login_repo_impl.dart' as _i253;
import '../../features/auth/login/domain/repo/auth_login_repo_contract.dart'
    as _i568;
import '../../features/auth/login/domain/usecase/auth_login_usecase.dart'
    as _i122;
import '../../features/auth/login/presentation/login_viewmodel/login_view_model.dart'
    as _i688;
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
    gh.factory<_i214.AuthLoginApiClient>(
      () => _i214.AuthLoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i612.AuthLoginRemoteDatasourceContract>(
      () => _i165.AuthLoginRemoteDatasourceImpl(gh<_i214.AuthLoginApiClient>()),
    );
    gh.factory<_i568.AuthLoginRepoContract>(
      () => _i253.AuthLoginRepoImpl(
        gh<_i612.AuthLoginRemoteDatasourceContract>(),
      ),
    );
    gh.lazySingleton<_i122.AuthLoginUseCase>(
      () => _i122.AuthLoginUseCase(gh<_i568.AuthLoginRepoContract>()),
    );
    gh.factory<_i688.LoginViewModel>(
      () => _i688.LoginViewModel(gh<_i122.AuthLoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i624.DioModule {}

class _$SecureStorageModule extends _i235.SecureStorageModule {}

class _$SharedPreferencesModule extends _i149.SharedPreferencesModule {}
