import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typograph {
  Typograph._();

  static TextStyle titleStyle = GoogleFonts.poppins(
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitleStyle =
      GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w500);

  static TextStyle normalStyle = GoogleFonts.poppins(
    fontSize: 18.0,
  );

  static TextStyle generalStyle = GoogleFonts.poppins(
    fontSize: 16.0,
  );
}
