import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/solid_button.dart';
import 'package:eventer_app/core/widgets/custom_snack_messenger.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/create_event/create_event_bloc.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/location_form/location_form_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/photo_stepper/photo_stepper_bloc.dart';
import 'package:eventer_app/features/create/presentation/widgets/details_step.dart';
import 'package:eventer_app/features/create/presentation/widgets/location_step.dart';
import 'package:eventer_app/features/create/presentation/widgets/photo_step.dart';
import 'package:eventer_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:eventer_app/core/utils/appTheme.dart';

class EventDetailCreatePage extends StatefulWidget {
  const EventDetailCreatePage({Key? key}) : super(key: key);

  @override
  _EventDetailCreatePageState createState() => _EventDetailCreatePageState();
}

class _EventDetailCreatePageState extends State<EventDetailCreatePage> {
  bool buttonEnabled = false;
  Map<String, dynamic> eventFormData = Map();
  @override
  void dispose() {
    getIt<EventDetailsFillCubit>().emit(EventDetailsFillState());
    getIt<PhotoStepperBloc>().add(InitPhotoStepperEvent());
    getIt<ChangePageCubit>().emit(ChangePageState(currentIndex: 0));
    getIt<LocationFormCubit>().emit(LocationFormState());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PhotoStepperBloc>(
              create: (_) => getIt<PhotoStepperBloc>()),
          BlocProvider<LocationFormCubit>(
              create: (_) => getIt<LocationFormCubit>()),
          BlocProvider<CreateEventBloc>(
              create: (_) => getIt<CreateEventBloc>()),
        ],
        child: Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<ChangePageCubit, ChangePageState>(
                listener: (context, state) {
                  if (state.currentIndex < 0) {
                    Navigator.pop(context);
                  }
                  if (state.buttonEnabled) {
                    buttonEnabled = true;
                  } else {
                    buttonEnabled = false;
                  }
                },
              ),
              BlocListener<CreateEventBloc, CreateEventState>(
                  listener: (context, state) {
                if (state is CreateEventSuccessState) {
                  showCustomSnackBar(
                      context: context,
                      messageType: SnackBarMessageType.INFO,
                      message: state.message);
                  Future.delayed(Duration(seconds: 1));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => DashBoardPage()),
                      (route) => false);
                }
                if (state is CreateEventFailedState) {
                  showCustomSnackBar(
                      context: context,
                      messageType: SnackBarMessageType.ERROR,
                      message: state.message);
                }
                if (state is CreateEventLoadingState) {
                  showCustomSnackBar(
                      context: context,
                      messageType: SnackBarMessageType.LOADING,
                      message: "Creating new event, please wait");
                }
              })
            ],
            child: SafeArea(child: LayoutBuilder(
              builder: (context, constraints) {
                final _maxHeight = constraints.maxHeight;
                final _minHeight = constraints.minHeight;
                final _minWidth = constraints.minWidth;
                final _maxWidth = constraints.maxWidth;
                return BlocBuilder<ChangePageCubit, ChangePageState>(
                  // buildWhen: (previous, next) =>
                  //     previous.currentIndex != next.currentIndex,
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _maxWidth * 0.02,
                          vertical: _maxHeight * 0.02),
                      constraints: BoxConstraints(maxHeight: _maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (state.currentIndex == 0) {
                                        Navigator.pop(context);
                                      } else {
                                        context.read<ChangePageCubit>()
                                          ..onPrevious(state.currentIndex);
                                      }
                                    },
                                    child: Icon(EvaIcons.arrowBack)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel".toUpperCase(),
                                    )),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                child: Builder(
                                  builder: (context) {
                                    if (state.currentIndex == 0) {
                                      return DetailsStepWidget(
                                          eventFormData: eventFormData,
                                          width: _maxWidth,
                                          height: _maxHeight);
                                    } else if (state.currentIndex == 1) {
                                      return LocationStepWidget(
                                        eventFormData: eventFormData,
                                        width: _maxWidth,
                                        height: _maxHeight,
                                      );
                                    } else if (state.currentIndex == 2) {
                                      return PhotoStepWidget(
                                        eventFormData: eventFormData,
                                        width: _maxWidth,
                                        height: _maxHeight,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              )),
                          Expanded(
                            flex: 0,
                            child: Container(
                              height: _maxHeight * .12,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: _maxWidth,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: state.currentIndex == 0 ||
                                                    state.currentIndex == 1 ||
                                                    state.currentIndex == 2
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                            height: 10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: state.currentIndex == 1 ||
                                                    state.currentIndex == 2
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                            height: 10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: state.currentIndex == 2
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.3),
                                            height: 10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<CreateEventBloc,
                                      CreateEventState>(
                                    builder: (context, createState) {
                                      return CustomSolidButton(
                                          text: "Next",
                                          height: 50.0,
                                          width: _maxWidth,
                                          onTap: () {
                                            if (buttonEnabled) {
                                              if (state.currentIndex == 2) {
                                                print("index of current page");
                                                context.read<CreateEventBloc>()
                                                  ..add(CreateNewEventEvent(
                                                      data: eventFormData));
                                              } else {
                                                context.read<ChangePageCubit>()
                                                  ..onNext(state.currentIndex);
                                              }
                                            }
                                          },
                                          color: buttonEnabled
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context).formBgColor);
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )),
          ),
        ),
      ),
    );
  }
}
