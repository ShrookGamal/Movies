
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class AppStyle{
  static final TextStyle newRealse = GoogleFonts.exo(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle recommend = GoogleFonts.exo(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle popular = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle date = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: ColorsManager.gray,
  );
  static final TextStyle rate = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle voteAverage = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle appBarTitle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle movieTitle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static final TextStyle overView = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorsManager.gray,
  );
}