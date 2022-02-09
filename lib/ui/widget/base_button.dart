import 'package:flutter/material.dart';
import 'package:flutter_template/res/resources.dart';
import 'package:flutter_template/ui/widget/custom_text_label.dart';
import 'package:scale_size/scale_size.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final BoxDecoration? decoration;
  final GestureTapCallback? onTap;
  final Widget? child;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;

  const BaseButton(
      {this.child,
      Key? key,
      this.decoration,
      this.onTap,
      this.backgroundColor,
      this.borderRadius,
      this.borderColor = Colors.transparent,
      this.margin,
      this.padding,
      this.alignment,
      this.width,
      this.height,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadiusInWell = BorderRadius.circular(0);
    if (this.borderRadius != null) {
      borderRadiusInWell = BorderRadius.circular(this.borderRadius!);
    }
    return Container(
      margin: this.margin ?? EdgeInsets.zero,
      alignment: this.alignment,
      decoration: decoration ??
          BoxDecoration(
              gradient: this.backgroundColor == null ? AppColors.base_color_gradient : null,
              color: this.backgroundColor ?? Colors.white,
              border: Border.all(color: borderColor!),
              borderRadius: BorderRadius.circular(borderRadius ?? 5.sw)),
      child: new Material(
        child: new InkWell(
          borderRadius: borderRadiusInWell,
          onTap: () {
              onTap?.call();
          },
          child: Container(
              width: width,
              height: height,
              padding: this.padding ?? EdgeInsets.symmetric(vertical: 12.sw, horizontal: 5.sw),
              child: Center(child: renderChild())),
        ),
        color: Colors.transparent,
      ),
    );
  }

  renderChild() {
    if (title != null) {
      return CustomTextLabel(
        title,
        fontWeight: FontWeight.w600,
        fontSize: 16.sw,
        color: AppColors.white,
      );
    }
    return child ?? Container();
  }
}
