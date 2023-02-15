import 'package:flutter_template/blocs/cubit.dart';
import 'package:flutter_template/data/network/datasources/datasource.dart';
import 'package:flutter_template/data/network/network.dart';
import 'package:flutter_template/data/network/repositories/repositories.dart';
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
    () => UserInfoCubit(repositoryImpl: getIt.get<UserRepositoryImpl>()),
  );
}

void registerRepositories(GetIt getIt) {
  getIt.registerLazySingleton(
    () => AuthRepositoryImpl(remoteDataSource: getIt.get()),
  );
  getIt.registerLazySingleton(
    () => UserRepositoryImpl(
      userLocalDataSource: getIt.get(),
      userRemoteDataSource: getIt.get(),
    ),
  );
}

void registerDataSource(GetIt getIt) {
  getIt.registerLazySingleton(() => AuthRemoteDataSourceImpl(network: getIt.get()));
  getIt.registerLazySingleton(() => UserLocalDataSourceImpl());
  getIt.registerLazySingleton(() => UserRemoteDataSourceImpl(network: getIt.get()));
}

void registerNetwork(GetIt getIt) {
  getIt.registerLazySingleton(() => Network.instance());
}
