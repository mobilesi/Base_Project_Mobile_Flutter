import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/base_bloc/base.dart';
import 'package:flutter_template/blocs/utils.dart';
import 'package:flutter_template/data/models/models.dart';
import 'package:flutter_template/data/network/repositories/user_repository.dart';

class UserInfoCubit extends Cubit<BaseState> {
  final UserRepositoryImpl repositoryImpl;

  UserInfoCubit({required this.repositoryImpl}) : super(InitState());

  getUserInfo() async {
    try {
      emit(LoadingState());
      UserModel userModel = await repositoryImpl.getUserInfo();
      emit(LoadedState(userModel));
    } catch (e) {
      if (e is NotFoundException) {
        // TODO handle for some case
      }
      emit(ErrorState(BlocUtils.getMessageError(e)));
    }
  }
}
