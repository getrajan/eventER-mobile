import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/material.dart';

class ProfileStatsCountWidget extends StatelessWidget {
  final String number;
  final String name;
  const ProfileStatsCountWidget(
      {Key? key, required this.number, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Typograph.subtitleStyle,
        ),
        Text(
          name,
          style: Typograph.generalStyle.copyWith(
            fontSize: 14.0,
            color: Theme.of(context).textColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
