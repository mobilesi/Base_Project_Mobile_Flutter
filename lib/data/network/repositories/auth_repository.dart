import 'package:flutter_template/data/models/user_model.dart';
import 'package:flutter_template/data/network/datasources/datasource.dart';

abstract class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({
    required this.remoteDataSource,
  });

  Future<UserModel> login(Map<String, dynamic> param);

  Future<UserModel> register(Map<String, dynamic> param);

  Future<bool> forgotPassword(Map<String, dynamic> param);
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSourceImpl remoteDataSource,
  }) : super(
          remoteDataSource: remoteDataSource,
        );

  @override
  Future<bool> forgotPassword(Map<String, dynamic> param) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(Map<String, dynamic> param) {
    return remoteDataSource.login(param);
  }

  @override
  Future<UserModel> register(Map<String, dynamic> param) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
