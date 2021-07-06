import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/bloc/tabbar/tabbar_cubit.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/color.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:eventer_app/features/profile/presentation/widgets/count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final _maxHeight = constraints.maxHeight;
          final _minHeight = constraints.minHeight;
          final _minWidth = constraints.minWidth;
          final _maxWidth = constraints.maxWidth;
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: _maxWidth * 0.05, vertical: _maxHeight * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: Typograph.subtitleStyle,
                    ),
                    IconButton(
                      icon: Icon(EvaIcons.edit2Outline),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://i.pinimg.com/736x/dc/5c/ca/dc5ccad5bd921a27a657ecfada3f00de.jpg',
                          ))),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: [
                        Text(
                          "Rajan karki",
                          style: Typograph.subtitleStyle,
                        ),
                        Text(
                          "Kathmandu, Nepal",
                          style: Typograph.generalStyle.copyWith(
                            fontSize: 13.0,
                            color: Theme.of(context).textColor.withOpacity(0.5),
                            // color: AppTheme.primaryColor
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileStatsCountWidget(
                          number: 42.toString(), name: "Events"),
                      ProfileStatsCountWidget(
                          number: "10.5 k", name: "Followers"),
                      ProfileStatsCountWidget(number: "400", name: "Followings")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: BlocBuilder<TabbarCubit, TabbarState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () =>
                                          context.read<TabbarCubit>()
                                            ..changeTabIndex(0),
                                      icon: Icon(
                                        EvaIcons.gridOutline,
                                        size: 30.0,
                                        color: state.index == 0
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .textColor
                                                .withOpacity(0.5),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      height: 1.0,
                                      width: _maxWidth / 2 - _maxWidth * 0.06,
                                      color: state.index == 0
                                          ? Theme.of(context).primaryColor
                                          : Colors.transparent)
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () =>
                                          context.read<TabbarCubit>()
                                            ..changeTabIndex(1),
                                      icon: Icon(EvaIcons.bookOpen,
                                          size: 30.0,
                                          color: state.index == 1
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .textColor
                                                  .withOpacity(0.5))),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      height: 1.0,
                                      width: _maxWidth / 2 - _maxWidth * 0.06,
                                      color: state.index == 1
                                          ? Theme.of(context).primaryColor
                                          : Colors.transparent)
                                ],
                              )
                            ],
                          ),
                          Builder(builder: (context) {
                            if (state.index == 0) {
                              return Container(
                                child: Text("Participate Events"),
                              );
                            } else if (state.index == 1) {
                              return Text("Your Tickets");
                            } else {
                              return Container();
                            }
                          })
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryColor
      ..strokeWidth = 2;
    final p1 = Offset(size.width * 0.05, size.height / 2);
    final p2 = Offset(size.width / 2, size.height / 2);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
