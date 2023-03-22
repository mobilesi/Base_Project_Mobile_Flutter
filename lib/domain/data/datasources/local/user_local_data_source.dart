import 'package:flutter_template/domain/data/models/models.dart';
import 'package:flutter_template/utils/shared_preference.dart';

class UserLocalDataSource {
  Future<UserModel?> getUserInfo() {
    return SharedPreferenceUtil.getUserInfo();
  }
}
