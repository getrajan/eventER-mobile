import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/presentation/blocs/upcomming_event/upcomming_event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcommingEventsWidget extends StatelessWidget {
  const UpcommingEventsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcommingEventBloc, UpcommingEventState>(
      builder: (context, state) {
        if (state is UpcommingEventsLoadedState) {
          final List<EventEntity> _events = state.events;
          return Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: _events.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final EventEntity _event = _events[index];
                  return Container(
                    child: ListTile(
                      title: Text(
                        _event.date.toUpperCase(),
                        style: Typograph.generalStyle.copyWith(
                            fontSize: 12.0,
                            color: AppTheme.yellowColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "${_event.title}\n",
                            style: Typograph.normalStyle.copyWith(
                              color: Theme.of(context).textColor,
                              fontSize: 16.0,
                            ),
                          ),
                          TextSpan(
                            text: "${_event.location}\n",
                            style: Typograph.generalStyle.copyWith(
                              color:
                                  Theme.of(context).textColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          )
                        ]),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          _event.coverPhoto,
                          width: 60,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).formBgColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Interested",
                            style: Typograph.generalStyle.copyWith(
                              color: Theme.of(context).textColor,
                              fontSize: 12.0,
                            ),
                          )),
                    ),
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
