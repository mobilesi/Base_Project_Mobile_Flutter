import 'package:flutter_template/data/models/models.dart';
import 'package:flutter_template/data/network/network.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> param);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Network network;

  AuthRemoteDataSourceImpl({required this.network});

  @override
  Future<UserModel> login(Map<String, dynamic> param) async {
    ApiResponse apiResponse = await network.post(url: ApiConstant.login, params: param);
    if (apiResponse.isSuccess) {
      return UserModel.fromJson(apiResponse.data);
    }
    return Future.error(apiResponse.errMessage);
  }
}
