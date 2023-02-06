import 'package:flutter/material.dart';
import 'package:flutter_template/res/colors.dart';
import 'package:flutter_template/ui/widget/base_button.dart';
import 'package:flutter_template/ui/widget/base_screen.dart';
import 'package:flutter_template/ui/widget/base_text_input.dart';
import 'package:scale_size/scale_size.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "st_app_name",
      body: Container(
        color: AppColors.white,
        child: Column(
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
              ),
            ),
            BaseButton(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              title: "login.title_login",
            )
          ],
        ),
      ),
    );
  }
}
