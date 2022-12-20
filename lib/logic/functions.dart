import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/elements.dart';
import '../home.dart';

abstract class GameLogic extends State<WordleHomePage> {
  late int gameIndex;
  late List<String> wordsEntered;

  @override
  void initState() {
    super.initState();
    gameIndex = 0;
    wordsEntered = ["", "", "", "", ""];
  }

  void addLetter(String letter) {
    setState(() {
      wordsEntered[gameIndex].length != 5
          ? wordsEntered[gameIndex] += letter
          : true;
    });
  }

  void deleteLetter() {
    setState(() {
      wordsEntered[gameIndex].isNotEmpty
          ? (wordsEntered[gameIndex] = wordsEntered[gameIndex]
              .substring(0, wordsEntered[gameIndex].length - 1))
          : true;
    });
  }

  void enter() {
    setState(() {
      if (wordsEntered[gameIndex].length == 5 && gameIndex < 4) {
        gameIndex++;
      } else {
        true;
      }
    });
  }

  void evaluate() {}
}
