import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/base_bloc/base.dart';
import 'package:flutter_template/res/colors.dart';
import 'package:flutter_template/ui/widget/custom_text_label.dart';
import 'package:scale_size/scale_size.dart';

class CustomSnackBar<T extends Cubit<BaseState>> extends StatelessWidget {
  final double? fontSize;
  final Color? textColor;

  const CustomSnackBar({Key? key, this.fontSize, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, BaseState>(
        child: Container(),
        listener: (context, state) {
          String? mess;
          if (state is LoadedState && state.msgError.isNotEmpty) {
            mess = state.msgError;
          } else if (state is ErrorState) {
            mess = state.data;
          }
          if (mess?.isNotEmpty ?? false) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: CustomTextLabel(
                mess,
                fontSize: fontSize ?? 14.sw,
                color: textColor ?? AppColors.white,
                fontWeight: FontWeight.w600,
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(20.sw),
              backgroundColor: AppColors.white,
              duration: Duration(milliseconds: 1400),
            ));
          }
        });
  }
}
