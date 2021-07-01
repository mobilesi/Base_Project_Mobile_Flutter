import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_template/res/resources.dart';
import 'package:flutter_template/ui/widget/custom_text_label.dart';
import 'package:flutter_template/utils/flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends StatelessWidget {
  static double TOOL_BARHEIGHT = 45.w;

  // body của màn hình
  final Widget body;

  // title của appbar có 2 kiểu String và Widget
  // title là kiểu Widget thì sẽ render widget
  // title là String
  final dynamic title;

  // trường hợp có AppBar đặc biệt thì dùng customAppBar
  final Widget customAppBar;

  // backgroundColor của AppBar mặc định là white
  final Color backgroundColor;

  // callBack của onBackPress với trường hợp  hiddenIconBack = false
  final Function onBackPress;

  // custom widget bên phải của appBar
  final List<Widget> rightWidgets;

  // loadingWidget để show loading toàn màn hình
  final Widget loadingWidget;

  // show thông báo
  final Widget messageNotify;
  final Widget floatingButton;

  // nếu true => sẽ ẩn backIcon , mặc định là true
  final bool hiddenIconBack;

  final Color colorTitle;
  final bool hideAppBar;

  const BaseScreen(
      {Key key,
      this.body,
      this.title = "",
      this.customAppBar,
      this.onBackPress,
      this.backgroundColor = Colors.white,
      this.rightWidgets,
      this.hiddenIconBack = false,
      this.colorTitle = AppColors.base_color,
      this.loadingWidget,
      this.hideAppBar = false,
      this.messageNotify,
      this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar ? null : (customAppBar == null ? BaseAppBar() : customAppBar),
        backgroundColor: backgroundColor,
        body: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                body ?? Container(),
                Positioned(
                  top: AppDimens.SIZE_0,
                  right: AppDimens.SIZE_0,
                  left: AppDimens.SIZE_0,
                  bottom: AppDimens.SIZE_0,
                  child: loadingWidget ?? Container(),
                ),
                messageNotify ?? Container()
              ],
            ),
          ),
        ),
        floatingActionButton: floatingButton ?? null);
  }

  BaseAppBar() {
    var widgetTitle;
    if (title is Widget) {
      widgetTitle = title;
    } else {
      widgetTitle = CustomTextLabel(
        this.title?.toString(),
        maxLines: 2,
        fontWeight: FontWeight.w500,
        fontSize: 22.w,
        textAlign: TextAlign.center,
        color: colorTitle,
      );
    }
    return AppBar(
      elevation: 0,
      toolbarHeight: TOOL_BARHEIGHT,
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
      title: widgetTitle,
      leading: hiddenIconBack
          ? Container()
          : InkWell(
              onTap: () {
                if (onBackPress != null) {
                  onBackPress();
                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.base_color,
                ),
              ),
            ),
      centerTitle: true,
      actions: rightWidgets ?? [],
    );
  }
}
