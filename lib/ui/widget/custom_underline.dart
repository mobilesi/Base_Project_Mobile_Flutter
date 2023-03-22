import 'package:flutter/material.dart';
import 'package:flutter_template/res/resources.dart';

class CustomUnderLine extends StatelessWidget {
  final Color color;

  const CustomUnderLine({Key? key, this.color = AppColors.border}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
    );
  }
}
