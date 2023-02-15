import 'package:flutter_template/data/models/models.dart';
import 'package:flutter_template/data/network/network.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserInfo();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final Network network;

  UserRemoteDataSourceImpl({required this.network});

  @override
  Future<UserModel> getUserInfo() async {
    ApiResponse apiResponse = await network.get(
      url: ApiConstant.getUserInfo,
    );
    if (apiResponse.isSuccess) {
      return UserModel.fromJson(apiResponse.data);
    }
    return Future.error(apiResponse.errMessage);
  }
}
