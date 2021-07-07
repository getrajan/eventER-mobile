import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/input_theme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/widgets/date_bottom_modal.dart';
import 'package:eventer_app/features/create/presentation/widgets/date_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventer_app/core/utils/appTheme.dart';

class DetailsStepWidget extends StatelessWidget {
  const DetailsStepWidget({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsFillCubit, EventDetailsFillState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Details",
                style: Typograph.subtitleStyle,
              ),
              SizedBox(height: 50.0),
              Form(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Name",
                        style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                      ),
                      TextFormField(
                        onChanged: (name) {
                          context.read<EventDetailsFillCubit>()
                            ..changeName(name);
                        },
                        decoration: InputTheme.formFieldDecoration()
                            .copyWith(fillColor: Theme.of(context).formBgColor),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "Start Date Time",
                        style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                      ),
                      DateInputWidget(
                          dateTimeEnum: DateTimeEnum.StartDateTime,
                          onTap: () {
                            _showDateBottomModal(
                                context, height, width, DateTimeEnum.StratTime);
                          }),
                      SizedBox(height: 15.0),
                      Text(
                        "End Date Time",
                        style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                      ),
                      DateInputWidget(
                          dateTimeEnum: DateTimeEnum.EndDateTime,
                          onTap: () {
                            _showDateBottomModal(
                                context, height, width, DateTimeEnum.EndTime);
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _showDateBottomModal(BuildContext context, double height, double width,
      DateTimeEnum dateTimeEnum) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        builder: (context) {
          return DateBottomModalWidget(
            height: height,
            width: width,
            dateTimeEnum: dateTimeEnum,
          );
        });
  }
}
