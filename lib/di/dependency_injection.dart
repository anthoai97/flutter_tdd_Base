import 'package:awesome_app/core/network/api_service.dart';
import 'package:awesome_app/core/utils/shared_pref_manager.dart';
import 'package:awesome_app/features/example/data/datasources/example_data_source.dart';
import 'package:awesome_app/features/example/data/repositories/example_r_impl.dart';
import 'package:awesome_app/features/example/domain/repostories/example_r.dart';
import 'package:awesome_app/features/example/domain/usecases/get_example.dart';
import 'package:awesome_app/features/example/presentation/bloc/example_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Feature - Example
  initFeature();

  // ! Core
  sl.registerLazySingleton<ApiService>(() => ApiService());
  sl.registerLazySingleton<SharedPrefManager>(
      () => SharedPrefManager(sharedPreferences: sl()));

  // ! External
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void initFeature() {
  // Example Feature
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
