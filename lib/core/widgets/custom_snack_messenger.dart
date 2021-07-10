import 'package:eventer_app/core/constant/enum.dart';
import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:eventer_app/core/utils/typograph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
    {required BuildContext context,
    required SnackBarMessageType messageType,
    required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        messageType == SnackBarMessageType.LOADING
            ? SizedBox(
                height: 30.0, width: 30.0, child: CircularProgressIndicator())
            : (messageType == SnackBarMessageType.ERROR
                ? Icon(
                    Icons.error,
                    color: AppTheme.redColor,
                  )
                : (messageType == SnackBarMessageType.INFO
                    ? Icon(
                        Icons.info,
                        color: Theme.of(context).primaryColor,
                      )
                    : SizedBox.shrink())),
        SizedBox(
          width: 10.0,
        ),
        Text(message,
            overflow: TextOverflow.visible,
            maxLines: 2,
            style: Typograph.normalStyle.copyWith(
              fontSize: 14.0,
            )),
      ],
    ),
  ));
}
