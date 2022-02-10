import 'package:awesome_app/core/network/api_service.dart';
import 'package:awesome_app/core/shared_pref/shared_pref_helper.dart';
import 'package:awesome_app/core/shared_pref/shared_pref_manager.dart';
import 'package:awesome_app/di/modules/local_modules.dart';
import 'package:awesome_app/di/modules/network_module.dart';
import 'package:awesome_app/features/example/data/datasources/example_data_source.dart';
import 'package:awesome_app/features/example/data/repositories/example_r_impl.dart';
import 'package:awesome_app/features/example/domain/repostories/example_r.dart';
import 'package:awesome_app/features/example/domain/usecases/get_example.dart';
import 'package:awesome_app/features/example/presentation/bloc/example_page_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Async singletons:----------------------------------------------------------
  sl.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // Singletons:----------------------------------------------------------------
  sl.registerSingleton(
      SharedPrefManager(await sl.getAsync<SharedPreferences>()));
  sl.registerSingleton(SharedPreferenceHelper(sl()));
  sl.registerSingleton<Dio>(NetWorkModule.provideDio(sl()));
  sl.registerSingleton(ApiService(sl<Dio>()));

  // Feature:-------------------------------------------------------------------
  _exampleFeature();
}

void _exampleFeature() {
  // Bloc
  sl.registerFactory(() => ExampleBloc(getExample: sl()));

  // Usecase
  sl.registerLazySingleton(() => GetExample(repository: sl()));

  // Repository
  sl.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(remoteDataSource: sl()));

  // Data source
  sl.registerLazySingleton<ExampleRemoteDataSource>(
      () => ExampleRemoteDataSourceImpl(apiService: sl()));
}
