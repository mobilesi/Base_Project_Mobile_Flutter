import 'package:flutter_template/data/models/models.dart';
import 'package:flutter_template/utils/shared_preference.dart';

abstract class UserLocalDataSource {
  Future<UserModel?> getUserInfo();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<UserModel?> getUserInfo() {
    return SharedPreferenceUtil.getUserInfo();
  }
}
