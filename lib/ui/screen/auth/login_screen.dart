import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/base_bloc/base_state.dart';
import 'package:flutter_template/blocs/cubit.dart';
import 'package:flutter_template/domain/repositories/repositories.dart';
import 'package:flutter_template/injection_container.dart';
import 'package:flutter_template/routes.dart';
import 'package:flutter_template/ui/widget/widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (_) => LoginCubit(repositoryImpl: getIt.get<AuthRepository>()), child: LoginBody());
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      loadingWidget: CustomLoading<LoginCubit>(),
      messageNotify: CustomSnackBar<LoginCubit>(),
      title: "st_app_name",
      body: Column(
        children: [
          Container(
            child: CustomTextInput(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              enableBorder: true,
              textController: TextEditingController(),
              hideUnderline: true,
              hintText: "Nhập tên đăng nhập",
              title: "Tên đăng nhập",
              validator: (String value) {
                if (value.isEmpty) {
                  return "Loi";
                }
              },
            ),
          ),
          BlocListener<LoginCubit, BaseState>(
            listener: (_, state) {
              if (state is LoadedState) {
                // can get user info in UserInfoCubit via GetIt without context
                getIt.get<UserInfoCubit>().getUserInfo();
                Navigator.pushNamed(context, Routes.mainScreen);
              }
            },
            child: Container(),
          ),
          BaseButton(
            onTap: () {
              BlocProvider.of<LoginCubit>(context).doLogin(userName: "111", password: "1232");
            },
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            title: "login.title_login",
          )
        ],
      ),
    );
  }
}
