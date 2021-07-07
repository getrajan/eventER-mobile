import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/core/widgets/top_bar.dart';
import 'package:eventer_app/features/create/domain/model/event_category.dart';
import 'package:eventer_app/features/create/presentation/blocs/event_details_fill/event_details_fill_cubit.dart';
import 'package:eventer_app/features/create/presentation/blocs/select_one/select_one_cubit.dart';
import 'package:eventer_app/features/create/presentation/pages/event_detail_create_page.dart';
import 'package:eventer_app/features/create/presentation/widgets/event_type.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  _EventCreatePageState createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  @override
  void dispose() {
    print("dispose create class");
    // BlocProvider.of<SelectTypeCubit>(context).close();
    super.dispose();
  }

  @override
  void initState() {
    print("init create event");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SelectOneCubit>(create: (_) => getIt<SelectOneCubit>()),
          BlocProvider(create: (_) => getIt<EventDetailsFillCubit>()),
        ],
        child: BlocListener<SelectOneCubit, SelectOneState>(
          listener: (context, state) {
            if (state.type != null && state.category != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EventDetailCreatePage()));
            }
          },
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final _maxHeight = constraints.maxHeight;
                final _minHeight = constraints.minHeight;
                final _minWidth = constraints.minWidth;
                final _maxWidth = constraints.maxWidth;

                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: _maxWidth * 0.05,
                      vertical: _maxHeight * 0.02),
                  child: Column(
                    children: [
                      TopBar(
                        title: "Create Event",
                        icon: null,
                      ),
                      Container(
                        constraints:
                            BoxConstraints(maxHeight: _maxHeight * 0.9),
                        // color: AppTheme.yellowColor,
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                constraints:
                                    BoxConstraints(maxHeight: _maxHeight * 0.9),
                                child: ListView(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Type",
                                      style: Typograph.generalStyle,
                                    ),
                                    BlocBuilder<SelectOneCubit, SelectOneState>(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            EventTypeWidget(
                                              eventType: EventType.Online,
                                              icon: EvaIcons.globeOutline,
                                              onTap: () =>
                                                  context.read<SelectOneCubit>()
                                                    ..changeType(1,
                                                        EventType.Online.value),
                                              bgColor:
                                                  state.currentTypeIndex == 1
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .formBgColor,
                                            ),
                                            EventTypeWidget(
                                                eventType: EventType.Offline,
                                                onTap: () => context.read<
                                                    SelectOneCubit>()
                                                  ..changeType(2,
                                                      EventType.Offline.value),
                                                bgColor:
                                                    state.currentTypeIndex == 2
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Theme.of(context)
                                                            .formBgColor,
                                                icon: EvaIcons.people),
                                          ],
                                        );
                                      },
                                    ),
                                    Text(
                                      "Select Category",
                                      style: Typograph.generalStyle,
                                    ),
                                    // UpcommingEventsWidget(),
                                    BlocBuilder<SelectOneCubit, SelectOneState>(
                                      builder: (context, state) {
                                        return Container(
                                          // color: Colors.yellow,
                                          margin: EdgeInsets.only(top: 10.0),
                                          constraints: BoxConstraints(
                                            minHeight: _maxHeight * 0.45,
                                            minWidth: _maxWidth,
                                          ),
                                          child: Stack(
                                              alignment: Alignment.topLeft,
                                              children: eventCategories
                                                  .map((e) => Positioned(
                                                        left: e.left,
                                                        top: e.top,
                                                        right: e.right,
                                                        bottom: e.bottom,
                                                        child: GestureDetector(
                                                          onTap: () => context.read<
                                                              SelectOneCubit>()
                                                            ..changeCategory(
                                                                e.index,
                                                                e.name),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    35.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: state.currentCategoryIndex ==
                                                                      e.index
                                                                  ? Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : Theme.of(
                                                                          context)
                                                                      .formBgColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Text(
                                                              e.name,
                                                              style: Typograph
                                                                  .generalStyle
                                                                  .copyWith(
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList()),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
