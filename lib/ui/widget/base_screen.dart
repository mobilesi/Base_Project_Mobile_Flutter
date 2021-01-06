import 'package:flutter/material.dart';
import 'package:flutter_template/res/colors.dart';
import 'package:flutter_template/res/resources.dart';

import 'custom_text_label.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget customAppBar;
  final Color backgroundColor;
  final bool isShowBack;
  final bool hideAppBar;
  final bool isLocalizeTitle;
  final Function onBackPress;
  final Widget rightWidget;
  final Widget loadingWidget;
  final Widget messageNotify;
  final bool haveFloatingButton;
  final Widget floatingButton;
  final Function actionFloatingButton;
  final bool hiddenBtnBack;
  final Color colorTitle;
  final bool boxShadow;

  const BaseScreen(
      {Key key,
      this.body,
      this.title = "",
      this.customAppBar,
      this.isShowBack = true,
      this.onBackPress,
      this.isLocalizeTitle = true,
      this.backgroundColor = Colors.white,
      this.rightWidget,
      this.haveFloatingButton = false,
      this.actionFloatingButton,
      this.hiddenBtnBack = false,
      this.colorTitle = AppColors.base_color,
      this.loadingWidget,
      this.hideAppBar = false,
      this.messageNotify,
      this.boxShadow = true,
      this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  hideAppBar ? Container() : (customAppBar == null ? _appBarCustom(context) : customAppBar),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: body == null ? Container() : body,
                    ),
                  )
                ],
              ),
            ),
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
      floatingActionButton: haveFloatingButton
          ? (floatingButton ??
              FloatingActionButton(
                onPressed: actionFloatingButton,
                child: Icon(Icons.add),
                backgroundColor: AppColors.base_color,
                elevation: 0,
              ))
          : null,
    );
  }

  _appBarCustom(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: boxShadow
            ? [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ]
            : null,
      ),
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          hiddenBtnBack
              ? SizedBox(width: AppDimens.SIZE_20)
              : InkWell(
                  onTap: () {
                    if (onBackPress != null) {
                      onBackPress();
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                        left: AppDimens.SIZE_10,
                      ),
                      padding: EdgeInsets.only(
                          left: AppDimens.SIZE_10,
                          right: AppDimens.SIZE_10,
                          top: AppDimens.SIZE_5,
                          bottom: AppDimens.SIZE_5),
                      child: Icon(
                        Icons.arrow_back,
                        color: backgroundColor == Colors.white ? AppColors.base_color : Colors.white,
                        size: AppDimens.SIZE_22,
                      )),
                ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
              top: AppDimens.SIZE_10,
              bottom: AppDimens.SIZE_10,
            ),
            child: CustomTextLabel(
              this.title,
              maxLines: 2,
              color: backgroundColor == Colors.white ? AppColors.base_color : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.SIZE_20,
            ),
          )),
          Container(padding: EdgeInsets.all(AppDimens.SIZE_10), child: rightWidget)
        ],
      ),
    );
  }
}
