import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle_app/utils/words.dart';

import '../ui/elements.dart';
import '../home.dart';

abstract class GameLogic extends State<WordleHomePage> {
  late String actualWord;
  late int gameIndex;
  late List<String> wordsEntered;
  late List<String> backgrounds;
  late bool gameFinished;
  late bool gameResult;

  @override
  void initState() {
    super.initState();
    actualWord = words[Random().nextInt(words.length)].toUpperCase();
    print(actualWord);
    gameIndex = 0;
    wordsEntered = ["", "", "", "", ""];
    backgrounds = ["", "", "", "", ""];
    gameFinished = false;
    gameResult = false;
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
    List<String> tempWord = ["", "", "", "", ""];
    if (wordsEntered[gameIndex].length == 5) {
      for (int i = 0; i < 5; i++) {
        tempWord[i] = actualWord[i];
      }
      print(tempWord);
      for (int i = 0; i < 5; i++) {
        if (tempWord[i] == wordsEntered[gameIndex][i]) {
          backgrounds[gameIndex] += "t";
          tempWord[i] = "";
        } else if (tempWord.contains(wordsEntered[gameIndex][i]) &&
            wordsEntered[gameIndex][i] != tempWord[i]) {
          backgrounds[gameIndex] += "n";
          tempWord[tempWord.indexOf(wordsEntered[gameIndex][i])] = "";
        } else if (!(tempWord.contains(wordsEntered[gameIndex][i]))) {
          backgrounds[gameIndex] += "f";
        }
        print(tempWord);
      }
    }
    print(backgrounds);
  }

  void enter() {
    setState(() {
      if (wordsEntered[gameIndex].length == 5 && gameFinished == false) {
        if (gameIndex < 4) {
          evaluateAndChangeBackgrounds();

          if (backgrounds[gameIndex] == "ttttt") {
            gameFinished = true;
            gameResult = true;
          } else if (backgrounds[3] != "") {
            gameFinished = true;
            gameResult = false;
          } else {
            gameIndex++;
          }
        } else {
          true;
        }
      }
    });
  }

  void restartGame() {
    setState(() {
      actualWord = "PLAIN";
      gameIndex = 0;
      wordsEntered = ["", "", "", "", ""];
      backgrounds = ["", "", "", "", ""];
      gameFinished = false;
    });
  }
}
