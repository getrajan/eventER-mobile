import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/material.dart';

class CustomSolidButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final onTap;
  const CustomSolidButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: Typograph.subtitleStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
