import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/res/resources.dart';

import '../../localizations.dart';
import 'locale_widget.dart';

class CustomTextLabel extends StatelessWidget {
  final title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;
  final double fontHeight;
  final bool isLocalizeTitle;

  const CustomTextLabel(this.title,
      {Key key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.maxLines,
      this.fontHeight,
      this.isLocalizeTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO custom font fontFamily
    return LocaleWidget(
      builder: (Language locale) {
        return Text(
          locale.getText(this.title) ?? this.title,
          textAlign: textAlign ?? TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines ?? 50,
          style: TextStyle(
              height: fontHeight == null ? 22.27 / 19 : fontHeight,
              fontSize: this.fontSize ?? AppDimens.SIZE_14,
              fontWeight: this.fontWeight ?? FontWeight.normal,
              color: this.color ?? Colors.black),
        );
      },
    );
  }
}
