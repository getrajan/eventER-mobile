import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/date_time_formatter.dart';
import 'package:eventer_app/core/utils/solid_button.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/widgets/date_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:eventer_app/core/utils/appTheme.dart';

class DateBottomModalWidget extends StatelessWidget {
  const DateBottomModalWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.dateTimeEnum})
      : super(key: key);
  final double height;
  final double width;
  final DateTimeEnum dateTimeEnum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsFillCubit, EventDetailsFillState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          height: height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                dateTimeEnum.value ?? "",
                style: Typograph.normalStyle,
              ),
              DateInputWidget(
                onTap: () {
                  DatePicker.showDatePicker(context, onConfirm: (date) {
                    if (dateTimeEnum.key == DateTimeEnum.EndTime.key) {
                      context.read<EventDetailsFillCubit>()
                        ..changeEndDate(myDateFormat(date));
                    }
                    context.read<EventDetailsFillCubit>()
                      ..changeStartDate(myDateFormat(date));
                  });
                },
                // dateTimeEnum: DateTimeEnum.StartDate,
                dateTimeEnum: dateTimeEnum.key == DateTimeEnum.EndTime.key
                    ? DateTimeEnum.EndDate
                    : DateTimeEnum.StartDate,
              ),
              DateInputWidget(
                dateTimeEnum: dateTimeEnum.key == DateTimeEnum.EndTime.key
                    ? DateTimeEnum.EndTime
                    : DateTimeEnum.StratTime,
                onTap: () {
                  DatePicker.showTime12hPicker(context, onConfirm: (time) {
                    if (dateTimeEnum.key == DateTimeEnum.EndTime.key) {
                      context.read<EventDetailsFillCubit>()
                        ..changeEndTime(myTimeFormat(time));
                    }
                    context.read<EventDetailsFillCubit>()
                      ..changeStartTime(myTimeFormat(time));
                  });
                },
              ),
              CustomSolidButton(
                  text: "Save",
                  height: 40.0,
                  width: width,
                  onTap: () {
                    if (dateTimeEnum.key == DateTimeEnum.EndTime.key) {
                      if (state.endDate != null && state.endTime != null) {
                        context.read<EventDetailsFillCubit>()
                          ..changeEndDateTime(
                              "${state.endDate}, ${state.endTime}");
                        Navigator.of(context).pop();
                      }
                    } else {
                      if (state.startDate != null && state.startTime != null) {
                        context.read<EventDetailsFillCubit>()
                          ..changeStartDateTime(
                              "${state.startDate}, ${state.startTime}");
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  color: (state.startDate != null && state.startTime != null)
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).formBgColor)
            ],
          ),
        );
      },
    );
  }
}
