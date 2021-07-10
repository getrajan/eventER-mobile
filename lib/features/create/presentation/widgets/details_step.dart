import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/input_theme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/widgets/date_bottom_modal.dart';
import 'package:eventer_app/features/create/presentation/widgets/date_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventer_app/core/utils/appTheme.dart';

class DetailsStepWidget extends StatefulWidget {
  const DetailsStepWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.eventFormData})
      : super(key: key);
  final double width;
  final double height;
  final Map<String, dynamic> eventFormData;

  @override
  _DetailsStepWidgetState createState() => _DetailsStepWidgetState();
}

class _DetailsStepWidgetState extends State<DetailsStepWidget> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChangePageCubit>()..checkValidation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventDetailsFillCubit, EventDetailsFillState>(
      listener: (context, state) {
        if (state.name.isNotEmpty) {
          widget.eventFormData['name'] = state.name;
        }
        if (state.description.isNotEmpty) {
          widget.eventFormData['description'] = state.description;
        }
        if (state.startDateTime.isNotEmpty) {
          widget.eventFormData['startDateTime'] = state.startDateTime;
        }
        if (state.endDateTime.isNotEmpty) {
          widget.eventFormData['endDateTime'] = state.endDateTime;
        }
      },
      child: BlocBuilder<EventDetailsFillCubit, EventDetailsFillState>(
        builder: (context, state) {
          print("Build now");
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.width * 0.02,
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
                          style:
                              Typograph.generalStyle.copyWith(fontSize: 14.0),
                        ),
                        TextFormField(
                          controller: _nameController,
                          onChanged: (name) {
                            context.read<EventDetailsFillCubit>()
                              ..changeName(name);
                          },
                          decoration: InputTheme.formFieldDecoration().copyWith(
                              fillColor: Theme.of(context).formBgColor),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "Start Date Time",
                          style:
                              Typograph.generalStyle.copyWith(fontSize: 14.0),
                        ),
                        DateInputWidget(
                            dateTimeEnum: DateTimeEnum.StartDateTime,
                            onTap: () {
                              _showDateBottomModal(context, widget.height,
                                  widget.width, DateTimeEnum.StratTime);
                            }),
                        SizedBox(height: 15.0),
                        Text(
                          "End Date Time",
                          style:
                              Typograph.generalStyle.copyWith(fontSize: 14.0),
                        ),
                        DateInputWidget(
                            dateTimeEnum: DateTimeEnum.EndDateTime,
                            onTap: () {
                              _showDateBottomModal(context, widget.height,
                                  widget.width, DateTimeEnum.EndTime);
                            }),
                        SizedBox(height: 15.0),
                        Text(
                          "Description",
                          style:
                              Typograph.generalStyle.copyWith(fontSize: 14.0),
                        ),
                        TextFormField(
                          maxLines: 10,
                          onChanged: (value) =>
                              context.read<EventDetailsFillCubit>()
                                ..changeDescription(value),
                          decoration: InputTheme.formFieldDecoration().copyWith(
                            fillColor: Theme.of(context).formBgColor,
                            contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
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
