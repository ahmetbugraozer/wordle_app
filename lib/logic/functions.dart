import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/elements.dart';
import '../home.dart';

abstract class GameLogic extends State<WordleHomePage> {
  late String actualWord;
  late int gameIndex;
  late List<String> wordsEntered;
  late List<String> backgrounds;
  late bool gameFinished;

  @override
  void initState() {
    super.initState();
    actualWord = "PLAIN";
    gameIndex = 0;
    wordsEntered = ["", "", "", "", ""];
    backgrounds = ["", "", "", "", ""];
    gameFinished = false;
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

  void evaluateAndChangeBackgrounds() {
    if (wordsEntered[gameIndex].length == 5) {
      for (int i = 0; i < 5; i++) {
        if (wordsEntered[gameIndex][i] == actualWord[i]) {
          backgrounds[gameIndex] += "t";
        } else if (actualWord.contains(wordsEntered[gameIndex][i]) &&
            actualWord[i] != wordsEntered[gameIndex][i]) {
          backgrounds[gameIndex] += "n";
        } else if (!(actualWord.contains(wordsEntered[gameIndex][i]))) {
          backgrounds[gameIndex] += "f";
        }
      }
    }
    print(backgrounds);
  }

  void enter() {
    setState(() {
      if (wordsEntered[gameIndex].length == 5 && gameFinished == false) {
        if (gameIndex < 4) {
          evaluateAndChangeBackgrounds();
          backgrounds[gameIndex] == "ttttt" ? gameFinished = true : gameIndex++;
        } else if (gameIndex == 4) {
          gameFinished = true;
        } else {
          true;
        }
      }
    });
  }
}
