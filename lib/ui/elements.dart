import 'package:flutter/material.dart';

class MyColors {
  static Color appBarColor = Colors.transparent;
  static Color backgroundColor = const Color.fromARGB(255, 31, 31, 31);
  static Color firstNeutralColor = const Color.fromARGB(255, 91, 91, 91);
  static Color lastResultSemiTrueColor = Colors.yellow;
  static Color lastResultTrueColor = Colors.green;
  static Color fullTrueColor = const Color.fromARGB(255, 72, 163, 75);
  static Color halfTrueColor = const Color.fromARGB(255, 208, 195, 76);
  static Color fullFalseColor = const Color.fromARGB(255, 63, 63, 63);
}

class MyTexts {
  static Text titleText =
      const Text("WORDLE", style: MyTextStyle.titleTextStyle);
  static Text gameOverText =
      const Text("Game Over!", style: MyTextStyle.titleTextStyle);
  static Text resultWinText =
      const Text("You Won!", style: MyTextStyle.resultTextStyle);
  static Text resultLoseText =
      const Text("You Lose! The word is ", style: MyTextStyle.resultTextStyle);
}

class MyTextStyle {
  static const TextStyle titleTextStyle =
      TextStyle(fontSize: 45, letterSpacing: 2);
  static const TextStyle letterTextStyle = TextStyle(fontSize: 30);
  static const TextStyle resultTextStyle = TextStyle(fontSize: 25);
  static const TextStyle resultWordTextStyle =
      TextStyle(fontSize: 25, color: Colors.grey);
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
