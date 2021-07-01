import 'package:flutter/material.dart';
import 'package:flutter_template/res/colors.dart';
import 'package:flutter_template/ui/widget/base_screen.dart';
import 'package:flutter_template/ui/widget/base_text_input.dart';

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
        child: Column(
          children: [
            Container(
              child: CustomTextInput(
                textController: TextEditingController(),
                hideUnderline: true,
                hintText: "",
//              padding: EdgeInsets.symmetric(horizontal: 10., vertical: 12.h),
//              onSubmitted: (text) => SystemChannels.textInput.invokeMethod('TextInput.hide'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
