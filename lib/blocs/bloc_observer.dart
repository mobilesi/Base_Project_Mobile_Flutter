
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    print('onChange ----cubit -- : ${cubit.runtimeType}, change: $change');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('onError ----cubit -- : ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

}