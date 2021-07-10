import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventer_app/core/utils/appTheme.dart';

class DateInputWidget extends StatelessWidget {
  final DateTimeEnum dateTimeEnum;
  final onTap;
  const DateInputWidget(
      {Key? key, required this.dateTimeEnum, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsFillCubit, EventDetailsFillState>(
      buildWhen: (current, next) => true,
      builder: (context, state) {
        String? dateValue;
        String? hint = dateTimeEnum.value;

        if (dateTimeEnum.key == DateTimeEnum.StartDate.key) {
          dateValue = state.startDate;
          // hint = dateTimeEnum.value;
        }
        if (dateTimeEnum.key == DateTimeEnum.StratTime.key) {
          dateValue = state.startTime;
          // hint = dateTimeEnum.value;
        }
        if (dateTimeEnum.key == DateTimeEnum.StartDateTime.key) {
          dateValue = state.startDateTime;
          hint = '';
        }
        if (dateTimeEnum.key == DateTimeEnum.EndDateTime.key) {
          dateValue = state.endDateTime;
          hint = '';
        }
        if (dateTimeEnum.key == DateTimeEnum.EndDate.key) {
          dateValue = state.endDate;
          // hint = dateTimeEnum.value;
        }
        if (dateTimeEnum.key == DateTimeEnum.EndTime.key) {
          dateValue = state.endTime;
          // hint = dateTimeEnum.value;
        }
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).formBgColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              title: Container(
                child: Text(
                  dateValue ?? hint ?? "",
                  style: Typograph.generalStyle.copyWith(
                    color: state.startDate != null
                        ? Theme.of(context).textColor
                        : Theme.of(context).textColor.withOpacity(0.5),
                  ),
                ),
              ),
              trailing: Icon(EvaIcons.arrowDown),
            ),
          ),
        );
      },
    );
  }
}
