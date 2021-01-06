import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class InitState extends BaseState {}

class LoadingState extends BaseState {}

class LoadedState<T> extends BaseState {
  final T data;
  final String msgError;
  final timeEmit;
  final bool isLocalizeMessage;

  LoadedState(this.data,
      {this.msgError = "", this.timeEmit, this.isLocalizeMessage = true});

  @override
  List<Object> get props => [data, msgError, timeEmit];
}

class ErrorState<T> extends BaseState {
  final T data;
  final bool isLocalizeMessage;

  ErrorState(this.data, {this.isLocalizeMessage = true}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class BaseStateRequest<T> {
  String messageError;
  bool isLoading;
  bool isSuccess;
  T data;

  BaseStateRequest.init({this.messageError, this.isLoading, this.data});

  BaseStateRequest.onLoading(
      {this.data,
      this.isSuccess = false,
      this.isLoading = true,
      this.messageError = ""});

  BaseStateRequest.onError(this.messageError,
      {this.data, this.isLoading = false, this.isSuccess = false});

  BaseStateRequest.onSuccess(this.data,
      {this.isLoading = false, this.messageError = "", this.isSuccess = true});
}

class DataStateRequest{
  BaseStateRequest stateRequest;

  DataStateRequest({this.stateRequest});
}
