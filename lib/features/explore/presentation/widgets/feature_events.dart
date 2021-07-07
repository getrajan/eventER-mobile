import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/material.dart';

class FeatureEventsWidget extends StatelessWidget {
  const FeatureEventsWidget({
    Key? key,
    required double height,
    required double width,
  })  : _maxHeight = height,
        _maxWidth = width,
        super(key: key);

  final double _maxHeight;
  final double _maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _maxHeight * 0.38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(1, 0))
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(),
            ),
            Expanded(
              child: Container(
                  width: _maxWidth,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            "assets/images/dummy-event.jpg",
                            width: _maxWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FRI, 17 JUL AT 12:45 PM",
                                style: Typograph.generalStyle.copyWith(
                                    fontSize: 12.0,
                                    color: Theme.of(context)
                                        .textColor
                                        .withOpacity(0.5)),
                              ),
                              Text(
                                "ANPA Conference 2021 proudly presents Dr. Joachim Frank",
                                style: Typograph.generalStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "45 Interested",
                                    style: Typograph.generalStyle.copyWith(
                                      color: Theme.of(context)
                                          .textColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "10 Going",
                                    style: Typograph.generalStyle.copyWith(
                                      color: Theme.of(context)
                                          .textColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(EvaIcons.heartOutline)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            EvaIcons.messageSquareOutline)),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).formBgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Interested",
                                        style: Typograph.generalStyle.copyWith(
                                            color: Theme.of(context).textColor),
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
