import 'package:eventer_app/core/utils/input_theme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/location_form/location_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationStepWidget extends StatefulWidget {
  final double width;
  final double height;
  final Map<String, dynamic> eventFormData;

  const LocationStepWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.eventFormData,
  }) : super(key: key);

  @override
  _LocationStepWidgetState createState() => _LocationStepWidgetState();
}

class _LocationStepWidgetState extends State<LocationStepWidget> {
  @override
  void initState() {
    context.read<ChangePageCubit>()..checkValidation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationFormCubit, LocationFormState>(
      listener: (context, state) {
        if (state.location.isNotEmpty) {
          widget.eventFormData['location'] = state.location;
        }
      },
      child: BlocBuilder<LocationFormCubit, LocationFormState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.width * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: Typograph.subtitleStyle,
                ),
                Text(
                  "Add a physical location of event",
                  style: Typograph.generalStyle.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Location",
                  style: Typograph.generalStyle.copyWith(fontSize: 14.0),
                ),
                TextFormField(
                  onChanged: (location) {
                    context.read<LocationFormCubit>()..changeLocation(location);
                  },
                  decoration: InputTheme.formFieldDecoration()
                      .copyWith(fillColor: Theme.of(context).formBgColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
