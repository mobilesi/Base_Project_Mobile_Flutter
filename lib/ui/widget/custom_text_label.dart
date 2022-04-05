import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/localizations.dart';
import 'package:scale_size/scale_size.dart';

import 'locale_widget.dart';

class CustomTextLabel extends StatelessWidget {
  final dynamic title;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;
  final double? fontHeight;
  final bool isLocalizeTitle;

  const CustomTextLabel(this.title,
      {Key? key,
        this.fontSize,
        this.fontWeight = FontWeight.normal,
        this.color = Colors.black,
        this.textAlign = TextAlign.start,
        this.maxLines = 50,
        this.fontHeight,
        this.isLocalizeTitle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO custom font fontFamily
    return LocaleWidget(
      builder: (Language? locale) {
        return Text(
          locale?.getText(this.title?.toString() ?? "") ?? (title?.toString() ?? ""),
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: TextStyle(
              height: fontHeight ?? 22.27 / 19, fontSize: fontSize ?? 14.sw, fontWeight: fontWeight, color: color),
        );
      },
    );
  }
}
