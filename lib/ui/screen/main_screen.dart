import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/base_bloc/base_state.dart';
import 'package:flutter_template/blocs/cubit.dart';
import 'package:flutter_template/injection_container.dart';
import 'package:flutter_template/ui/widget/base_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: MainBody());
  }
}

class MainBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        children: [
          BlocBuilder<UserInfoCubit, BaseState>(
            bloc: getIt.get<UserInfoCubit>(),
            builder: (_, state) {
              // TODO handle user info here
              return Container();
            },
          )
        ],
      ),
    );
  }
}
