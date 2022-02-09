import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template/res/resources.dart';
import 'package:flutter_template/routes.dart';
import 'package:flutter_template/utils/shared_preference.dart';
import 'package:scale_size/scale_size.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => openScreen(context));
  }

  Widget build(BuildContext context) {
    ScaleSize.init(context, designWidth: 375, designHeight: 812);
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
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
    }
  }
}
