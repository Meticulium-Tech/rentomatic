import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentomatic/utils/utils.dart';

class Styles {
  static TextStyle title = GoogleFonts.arvo(
    color: Palette.primary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title2 = GoogleFonts.arvo(
    color: Palette.light,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body = GoogleFonts.abel(
    color: Palette.secondary,
    fontSize: 20,
  );
}
