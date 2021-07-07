import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/core/widgets/top_bar.dart';
import 'package:eventer_app/features/explore/presentation/blocs/upcomming_event/upcomming_event_bloc.dart';
import 'package:eventer_app/features/explore/presentation/widgets/feature_events.dart';
import 'package:eventer_app/features/explore/presentation/widgets/upcomming_events.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UpcommingEventBloc>(
              create: (_) =>
                  getIt<UpcommingEventBloc>()..add(UpcommingEventsLoadEvent()))
        ],
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final _maxHeight = constraints.maxHeight;
              final _minHeight = constraints.minHeight;
              final _minWidth = constraints.minWidth;
              final _maxWidth = constraints.maxWidth;
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: _maxWidth * 0.05, vertical: _maxHeight * 0.02),
                child: Column(
                  children: [
                    TopBar(
                      title: "Explore",
                      icon: EvaIcons.bellOutline,
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: _maxHeight * 0.9),
                      // color: Colors.red,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: Container(
                            constraints:
                                BoxConstraints(maxHeight: _maxHeight * 0.85),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Feature Events",
                                      style: Typograph.subtitleStyle,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "view all",
                                        style: Typograph.generalStyle.copyWith(
                                            color: Theme.of(context).textColor),
                                      ),
                                    )
                                  ],
                                ),
                                FeatureEventsWidget(
                                    height: _maxHeight, width: _maxWidth),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Upcomming Events",
                                      style: Typograph.subtitleStyle,
                                    ),
                                    // TextButton(
                                    //   onPressed: () {},
                                    //   child: Text(
                                    //     "view all",
                                    //     style: Typograph.generalStyle.copyWith(
                                    //         color: Theme.of(context).textColor),
                                    //   ),
                                    // )
                                  ],
                                ),
                                UpcommingEventsWidget()
                              ],
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
