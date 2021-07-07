import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:flutter/material.dart';

class InterestedEvnetsWidget extends StatelessWidget {
  const InterestedEvnetsWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          event.date,
          style: Typograph.generalStyle.copyWith(
              fontSize: 13.0,
              color: AppTheme.yellowColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${event.title}\n",
              style: Typograph.normalStyle
                  .copyWith(color: Theme.of(context).textColor),
            ),
            TextSpan(
              text: "${event.location}\n",
              style: Typograph.generalStyle.copyWith(
                  color: Theme.of(context).textColor.withOpacity(0.5)),
            )
          ]),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            event.coverPhoto,
            width: 60,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
