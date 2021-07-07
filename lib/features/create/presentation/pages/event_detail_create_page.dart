import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/utils/solid_button.dart';
import 'package:eventer_app/features/create/presentation/blocs/change_page/change_page_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/widgets/details_step.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EventDetailCreatePage extends StatefulWidget {
  const EventDetailCreatePage({Key? key}) : super(key: key);

  @override
  _EventDetailCreatePageState createState() => _EventDetailCreatePageState();
}

class _EventDetailCreatePageState extends State<EventDetailCreatePage> {
  @override
  void dispose() {
    getIt<EventDetailsFillCubit>().emit(EventDetailsFillState());
    print("dispose details create");
    super.dispose();
  }

  @override
  void initState() {
    getIt<EventDetailsFillCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: MultiBlocProvider(
            providers: [
              BlocProvider<ChangePageCubit>(
                  create: (_) => getIt<ChangePageCubit>())
            ],
            child: SafeArea(child: LayoutBuilder(
              builder: (context, constraints) {
                final _maxHeight = constraints.maxHeight;
                final _minHeight = constraints.minHeight;
                final _minWidth = constraints.minWidth;
                final _maxWidth = constraints.maxWidth;
                return BlocBuilder<ChangePageCubit, ChangePageState>(
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _maxWidth * 0.02,
                          vertical: _maxHeight * 0.02),
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
                                      context.read<ChangePageCubit>()
                                        ..onPrevious(state.currentIndex);
                                    },
                                    child: Icon(EvaIcons.arrowBack)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel".toUpperCase(),
                                    )),
                              ],
                            ),
                          ),
                          Expanded(child: Builder(
                            builder: (context) {
                              if (state.currentIndex == 0) {
                                return DetailsStepWidget(
                                    width: _maxWidth, height: _maxHeight);
                              } else if (state.currentIndex == 1) {
                                return Container(
                                  child: Text("Next page"),
                                );
                              } else {
                                return Container();
                              }
                            },
                          )),
                          Container(
                            height: _maxHeight * .1,
                            // color: AppColors.mainColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: _maxWidth,
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                CustomSolidButton(
                                    text: "Next",
                                    height: 50.0,
                                    width: _maxWidth,
                                    onTap: () {
                                      context.read<ChangePageCubit>()
                                        ..onNext(state.currentIndex);
                                    },
                                    color: Theme.of(context).primaryColor)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ))),
      ),
    );
  }
}
