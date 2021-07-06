import 'package:eventer_app/core/utils/appTheme.dart';
import 'package:flutter/material.dart';

class InputTheme {
  InputTheme._();

  static InputDecoration formFieldDecoration() => InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppTheme.semiLightColor, width: 0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        ),
      );
}
