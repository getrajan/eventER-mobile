import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  const TopBar({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Typograph.subtitleStyle
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          IconButton(
            icon: Icon(icon),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
