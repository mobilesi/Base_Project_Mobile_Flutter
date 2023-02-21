import 'package:flutter_template/blocs/cubit.dart';
import 'package:flutter_template/domain/data/datasources/datasource.dart';
import 'package:flutter_template/domain/network/network.dart';
import 'package:flutter_template/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init({GetIt? getIt}) async {
  if (getIt == null) {
    getIt = GetIt.instance;
  }
  // network
  registerNetwork(getIt);
  // data source
  registerDataSource(getIt);
  // repositories
  registerRepositories(getIt);
  // bloc cubit
  registerCubit(getIt);
}

void registerCubit(GetIt getIt) {
  getIt.registerLazySingleton(
    () => UserInfoCubit(repository: getIt.get<UserRepositoryImpl>()),
  );
}

void registerRepositories(GetIt getIt) {
  getIt.registerLazySingleton(
    () => AuthRepository(remoteDataSource: getIt.get()),
  );
  getIt.registerLazySingleton(
    () => UserRepositoryImpl(
      userLocalDataSource: getIt.get(),
      userRemoteDataSource: getIt.get(),
    ),
  );
}

void registerDataSource(GetIt getIt) {
  getIt.registerLazySingleton(() => AuthRemoteDataSource(network: getIt.get()));
  getIt.registerLazySingleton(() => UserLocalDataSource());
  getIt.registerLazySingleton(() => UserRemoteDataSource(network: getIt.get()));
}

void registerNetwork(GetIt getIt) {
  getIt.registerLazySingleton(() => Network.instance());
}
