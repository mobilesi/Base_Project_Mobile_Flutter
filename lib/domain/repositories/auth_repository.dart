import 'package:flutter_template/domain/data/datasources/datasource.dart';
import 'package:flutter_template/domain/data/models/models.dart';

class AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepository({
    required this.remoteDataSource,
  });

  Future<UserModel> login(Map<String, dynamic> param) {
    return remoteDataSource.login(param);
  }

  Future<UserModel> register(Map<String, dynamic> param) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
