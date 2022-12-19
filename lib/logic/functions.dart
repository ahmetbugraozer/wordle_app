import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/elements.dart';
import '../home.dart';

abstract class GameLogic extends State<WordleHomePage> {
  late String word;
  late int gameIndex;
  late List<String> wordsEntered;

  @override
  void initState() {
    super.initState();
    word = "";
    gameIndex = 0;
    wordsEntered = [];
  }

  void addLetter(String letter) {
    setState(() {
      word.length != 5 ? word += letter : true;
    });
  }

  void deleteLetter() {
    setState(() {
      word.isNotEmpty ? (word = word.substring(0, word.length - 1)) : true;
    });
  }

  void enter() {
    setState(() {
      gameIndex < 4 ? gameIndex++ : true;
    });

    print(gameIndex);
  }

  void evaluate() {}
}
