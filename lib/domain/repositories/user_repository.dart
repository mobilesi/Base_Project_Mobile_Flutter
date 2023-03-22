import 'package:flutter_template/domain/data/datasources/datasource.dart';
import 'package:flutter_template/domain/data/models/models.dart';

abstract class UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  UserRepository(this.userLocalDataSource, this.userRemoteDataSource);

  Future<UserModel> getUserInfo();
}

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(
      {required UserLocalDataSource userLocalDataSource, required UserRemoteDataSource userRemoteDataSource})
      : super(userLocalDataSource, userRemoteDataSource);

  @override
  Future<UserModel> getUserInfo() async {
    UserModel? userModel;
    try {
      userModel = await userRemoteDataSource.getUserInfo();
    } catch (e) {
      userModel = await userLocalDataSource.getUserInfo();
    }
    if (userModel == null) {
      return Future.error(NotFoundException());
    }
    return userModel;
  }
}
