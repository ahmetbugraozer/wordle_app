import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Images {
  static Image projectIcon = Image.asset("assets/iconShrink.png");
}

class MyColors {
  static Color appBarColor = Colors.transparent;
  static Color backgroundColor = const Color.fromARGB(255, 31, 31, 31);
  static Color firstNeutralColor = const Color.fromARGB(255, 91, 91, 91);
  static Color lastResultSemiTrueColor =
      const Color.fromARGB(255, 208, 192, 48);
  static Color lastResultTrueColor = const Color.fromARGB(255, 61, 142, 64);
  static Color keyboardFalseColor = Colors.black;
}

class MyTexts {
  static Text titleText = Text("WORDLE", style: MyTextStyle.titleTextStyle);
  static Text selectionText = Text("Select amount of letter to start playing:",
      style: MyTextStyle.selectionTextStyle);

  static Text gameOverText =
      Text("Game Over!", style: MyTextStyle.titleTextStyle);
  static Text resultWinText =
      Text("You Won!", style: MyTextStyle.resultTextStyle);
  static Text resultLoseText =
      Text("You Lose! The word was ", style: MyTextStyle.selectionTextStyle);
  static Text restartText =
      Text("Restart Game", style: MyTextStyle.selectionTextStyle);
  static Text inappriopriateWord =
      Text("Please enter a valid word!", style: MyTextStyle.warningTextStyle);
}

class MyTextStyle {
  static TextStyle titleTextStyle =
      GoogleFonts.poppins(fontSize: 45, letterSpacing: 2);
  static TextStyle selectionTextStyle = GoogleFonts.poppins(fontSize: 16);
  static TextStyle letterTextStyle =
      GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700);
  static TextStyle resultTextStyle = GoogleFonts.poppins(fontSize: 25);
  static TextStyle resultWordTextStyle =
      GoogleFonts.poppins(fontSize: 25, color: Colors.grey);
  static TextStyle warningTextStyle = GoogleFonts.poppins(fontSize: 20);
}

class MyDecorations {
  static Decoration keyBoardDecoration = const BoxDecoration(
      shape: BoxShape.rectangle, color: Color.fromARGB(0, 54, 54, 54));
}

class MyThemes {
  static ThemeData projectTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: MyColors.backgroundColor,
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0));
}
