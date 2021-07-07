import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/material.dart';

class EventTypeWidget extends StatelessWidget {
  final EventType eventType;
  final IconData icon;
  final Color? bgColor;
  final onTap;
  const EventTypeWidget(
      {Key? key,
      required this.eventType,
      required this.icon,
      this.bgColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(icon),
                Text(
                  eventType.key.toString(),
                  style: Typograph.subtitleStyle,
                ),
              ],
            ),
            Text(
              eventType == EventType.Online
                  ? "Event through online medium like Zoom, Google Meets, Teams and so on"
                  : "Event will be conduct physically at specific location",
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: Typograph.generalStyle,
            )
          ],
        ),
      ),
    );
  }
}
