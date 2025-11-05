import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  FlutterFlowTheme();

  // Sample TextStyles (replace with your actual styles)
  TextStyle get labelMedium => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: Colors.black87,
  );

  TextStyle get labelSmall => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: Colors.black54,
  );

  TextStyle get titleSmall => GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  TextStyle get bodyMedium => GoogleFonts.merienda(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: const Color(0xFF56C9CF),
  );

  Color get primaryBackground => const Color(0xFFFFFFFF);
  Color get secondaryBackground => const Color(0xFFF0F0F0);
  Color get error => Colors.red;
  Color get primaryText => Colors.black87;

  get primaryColor => null;

  static FlutterFlowTheme of(BuildContext context) {
    // If you want, add context-based theme logic here
    return FlutterFlowTheme();
  }
}
