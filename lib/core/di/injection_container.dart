import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/users/data/datasources/user_remote_data_source.dart';
import '../../features/users/data/repositories/user_repository_impl.dart';
import '../../features/users/domain/repositories/user_repository.dart';
import '../../features/users/domain/usecases/get_users.dart';
import '../../features/users/presentation/cubit/users_cubit.dart';
import '../../features/pace_selector/presentation/cubit/pace_cubit.dart';
import '../../features/pace_selector/domain/usecases/submit_pace.dart';
import '../../features/pace_selector/domain/repositories/pace_repository.dart';
import '../../features/pace_selector/data/repositories/pace_repository_impl.dart';
import '../../features/pace_selector/data/datasources/pace_remote_data_source.dart';
import '../network/api_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Pace Selector
  sl.registerFactory(() => PaceCubit(submitPaceUseCase: sl()));
  sl.registerLazySingleton(() => SubmitPaceUseCase(sl()));
  sl.registerLazySingleton<PaceRepository>(
    () => PaceRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PaceRemoteDataSource>(
    () => PaceRemoteDataSourceImpl(dio: sl()),
  );

  // Features - Users
  // Cubit
  sl.registerFactory(() => UsersCubit(getUsersUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUsersUseCase(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: sl()),
  );

  // External
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  );
}
