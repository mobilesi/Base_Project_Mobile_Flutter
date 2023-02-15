import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/base_bloc/base.dart';
import 'package:flutter_template/blocs/utils.dart';
import 'package:flutter_template/data/models/models.dart';
import 'package:flutter_template/data/network/repositories/repositories.dart';

class LoginCubit extends Cubit<BaseState> {
  final AuthRepositoryImpl repositoryImpl;

  LoginCubit({required this.repositoryImpl}) : super(InitState());

  doLogin({String? userName, String? password}) async {
    try {
      emit(LoadingState());
      UserModel userModel = await repositoryImpl.login({
        "userName": userName,
        "password": password,
      });
      emit(LoadedState(userModel));
    } catch (e) {
      emit(ErrorState(BlocUtils.getMessageError(e)));
    }
  }
}
