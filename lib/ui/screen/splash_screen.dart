import 'package:flutter/material.dart';
import 'package:flutter_template/res/resources.dart';
import 'package:flutter_template/routes.dart';
import 'package:flutter_template/utils/flutter_screenutil/screen_util.dart';
import 'package:flutter_template/utils/shared_preference.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => openScreen(context));
    return Scaffold(
      body: Container(
        color: AppColors.base_color,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.LOGIN_BACKGROUND),
                  fit: BoxFit.cover,
                ),
              ), /* add child content here */
            ),
          ],
        ),
      ),
    );
  }

  openScreen(BuildContext context) async {
    String token = await SharedPreferenceUtil.getToken();
    await Future.delayed(Duration(seconds: 2));
    if (token.isEmpty) {
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
    }
  }
}
