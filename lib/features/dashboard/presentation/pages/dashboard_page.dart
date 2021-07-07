import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:eventer_app/features/create/presentation/pages/event_create_page.dart';
import 'package:eventer_app/features/dashboard/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:eventer_app/features/explore/presentation/pages/explore_page.dart';
import 'package:eventer_app/features/profile/presentation/pages/profile_page.dart';
import 'package:eventer_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBloc>(
      create: (context) => getIt<BottomNavBloc>(),
      child: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        final _maxHeight = constraints.maxHeight;
        final _minHeight = constraints.minHeight;
        final _minWidth = constraints.minWidth;
        final _maxWidth = constraints.maxWidth;
        return BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            if (state is CurrentIndexChangedState) {
              final _currentIndex = state.currentIndex;
              return Stack(
                children: [
                  Builder(builder: (context) {
                    if (_currentIndex == 4) {
                      return ProfilePage();
                    } else if (_currentIndex == 0) {
                      return ExplorePage();
                    } else if (_currentIndex == 2) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => EventCreatePage()));
                      return EventCreatePage();
                    }

                    return Container();
                  }),
                  Positioned(
                    bottom: 10.0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: _maxWidth,
                      height: _maxHeight * 0.07,
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 0.5,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () => context.read<BottomNavBloc>()
                              ..add(PageTappedEvent(0)),
                            icon: Icon(
                              EvaIcons.globe2Outline,
                              color: _currentIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.read<BottomNavBloc>()
                              ..add(PageTappedEvent(1)),
                            icon: Icon(
                              EvaIcons.heartOutline,
                              color: _currentIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.read<BottomNavBloc>()
                              ..add(PageTappedEvent(2)),
                            icon: Icon(
                              EvaIcons.plusCircleOutline,
                              color: _currentIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.read<BottomNavBloc>()
                              ..add(PageTappedEvent(3)),
                            icon: Icon(
                              EvaIcons.messageCircleOutline,
                              color: _currentIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.read<BottomNavBloc>()
                              ..add(PageTappedEvent(4)),
                            icon: Icon(
                              EvaIcons.personOutline,
                              color: _currentIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        );
      })),
    );
  }
}
