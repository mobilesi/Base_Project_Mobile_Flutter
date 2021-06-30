import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/flutter_screenutil/flutter_screenutil.dart';

import '../../localizations.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';

class CustomTextInput extends StatefulWidget {
  final onSubmitted;
  final TextInputType keyboardType;
  final String title;
  final TextStyle titleStyle;
  final int maxLines;
  final TextInputAction textInputAction;
  String errorText;
  final Function getTextFieldValue;
  final int minLines;
  final Function changeFocus;
  final String hintText;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final initData;
  final double width;
  final TextEditingController textController;
  final TextAlign align;
  final bool enabled;
  final hideUnderline;
  final formatNumber;
  final TextStyle style;
  final int maxLength;
  final formatPercent;
  final bool formatDecimal;
  final bool isPassword;

  CustomTextInput({
    Key key,
    this.getTextFieldValue,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.title = "",
    this.maxLines = 1,
    this.textInputAction,
    this.errorText = "",
    this.minLines = 1,
    this.changeFocus,
    this.hintText = "",
    this.margin,
    this.padding,
    this.initData,
    this.titleStyle,
    this.width,
    this.textController,
    this.align,
    this.enabled = true,
    this.hideUnderline = false,
    this.style,
    this.formatNumber = false,
    this.maxLength = TextField.noMaxLength,
    this.formatPercent = false,
    this.formatDecimal = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<CustomTextInput> {
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    if (widget.initData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.textController.text = widget.initData.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      margin: widget.margin ?? EdgeInsets.zero,
      child: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.SIZE_5)),
            child: TextField(
              maxLength: widget.maxLength,
              cursorColor: AppColors.tacha,
              enabled: widget.enabled,
              textAlign: widget.align ?? TextAlign.start,
              style: widget.style ??
                  TextStyle(color: AppColors.tacha, fontSize: AppDimens.SIZE_14, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                  counterText: "",
                  focusColor: Colors.white,
                  border: InputBorder.none,
                  disabledBorder: widget.hideUnderline
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.base_color_border_textfield, width: 1),
                        ),
                  focusedBorder: widget.hideUnderline
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.tacha, width: 1),
                        ),
                  enabledBorder: widget.hideUnderline
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: Language.of(context).getText(widget.hintText),
                  isDense: true,
                  // and add this line
                  contentPadding: widget.padding ?? EdgeInsets.only(left: 0, top: 5.h, right: 0, bottom: 5.h),
                  suffixIconConstraints: BoxConstraints(
                    maxWidth: 24.w,
                    maxHeight: 24.h,
                  ),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          padding: EdgeInsets.all(4.h),
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.tacha,
                            size: 16.w,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        )
                      : Container()),
              controller: widget.textController,
              obscureText: widget.isPassword ? !_passwordVisible : false,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              onTap: () {
                if (widget.textController.text == '0') {
                  widget.textController.selection =
                      TextSelection.fromPosition(TextPosition(offset: widget.textController.text.length));
                }
              },
              onChanged: (_text) {
                String currentText = _text.trim();
                widget.getTextFieldValue(currentText);
              },
            ),
          ),
          widget.errorText != ""
              ? Container(
                  margin: EdgeInsets.only(top: AppDimens.SIZE_6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error,
                        size: AppDimens.SIZE_13,
                        color: Colors.red,
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          Language.of(context).getText(widget.errorText),
                          style: TextStyle(color: Colors.red, fontSize: AppDimens.SIZE_12),
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
