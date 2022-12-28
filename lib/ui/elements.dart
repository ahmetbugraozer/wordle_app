import 'package:flutter/material.dart';

class MyColors {
  static Color appBarColor = Colors.transparent;
  static Color backgroundColor = const Color.fromARGB(255, 31, 31, 31);
  static Color firstNeutralColor = const Color.fromARGB(255, 91, 91, 91);
  static Color lastResultSemiTrueColor = Colors.yellow;
  static Color lastResultTrueColor = Colors.green;
  static Color keyboardFalseColor = Colors.black;
}

class MyTexts {
  static Text titleText =
      const Text("WORDLE", style: MyTextStyle.titleTextStyle);
  static Text selectionText = const Text(
      "Select amount of letter to start playing:",
      style: MyTextStyle.selectionTextStyle);

  static Text gameOverText =
      const Text("Game Over!", style: MyTextStyle.titleTextStyle);
  static Text resultWinText =
      const Text("You Won!", style: MyTextStyle.resultTextStyle);
  static Text resultLoseText =
      const Text("You Lose! The word was ", style: MyTextStyle.resultTextStyle);
  static Text restartText = const Text("Restart Game");
}

class MyTextStyle {
  static const TextStyle titleTextStyle =
      TextStyle(fontSize: 45, letterSpacing: 2);
  static const TextStyle selectionTextStyle = TextStyle(fontSize: 20);
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
