import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widget/custom_text_label.dart';
import '../../res/dimens.dart';
import '../../res/resources.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final Color colorBackground;
  final Function onPress;
  final EdgeInsets margin;

  const CustomButton(this.title, this.onPress, {Key key, this.width, this.colorBackground, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress();
        }
      },
      child: Container(
        height: AppDimens.SIZE_50,
        margin: margin ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorBackground ?? AppColors.base_color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimens.SIZE_4), bottomRight: Radius.circular(AppDimens.SIZE_4)),
        ),
        child: CustomTextLabel(
          title.toUpperCase(),
          color: Colors.white,
          fontSize: AppDimens.SIZE_16,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
