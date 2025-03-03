// game_logic.dart
import 'dart:math';
import 'package:flutter/material.dart';

class GameLogic {
  final int wordLength;
  final List<String> wordList;
  static const int maxAttempts = 5;

  late String actualWord;
  late int gameIndex;
  late List<String> wordsEntered;
  late List<String> backgrounds;
  late bool gameFinished;
  late bool gameResult;
  late String trueLetters;
  late String neutralLetters;
  late String wrongLetters;
  late bool continueStatus;

  GameLogic({
    required this.wordLength,
    required this.wordList,
  });

  void initializeGame() {
    actualWord = _getRandomWord();
    debugPrint('Debug - Actual Word: $actualWord');
    gameIndex = 0;
    trueLetters = '';
    neutralLetters = '';
    wrongLetters = '';
    wordsEntered = List.filled(maxAttempts, '');
    backgrounds = List.filled(maxAttempts, '');
    gameFinished = false;
    gameResult = false;
    continueStatus = true;
  }

  String _getRandomWord() =>
      wordList[Random().nextInt(wordList.length)].toUpperCase();

  void addLetter(String letter) {
    if (gameFinished) return;
    if (wordsEntered[gameIndex].length < wordLength) {
      wordsEntered[gameIndex] += letter;
    }
  }

  void deleteLetter() {
    if (gameFinished) return;
    if (wordsEntered[gameIndex].isNotEmpty) {
      wordsEntered[gameIndex] = wordsEntered[gameIndex]
          .substring(0, wordsEntered[gameIndex].length - 1);
    }
  }

  void evaluateAndChangeBackgrounds() {
    List<String> tempWord = actualWord.split('');
    String currentWord = wordsEntered[gameIndex];
    String result = '';

    for (int i = 0; i < wordLength; i++) {
      if (currentWord[i] == tempWord[i]) {
        result += 't';
        tempWord[i] = '*';
        trueLetters += currentWord[i];
      } else {
        result += 'x';
      }
    }

    for (int i = 0; i < wordLength; i++) {
      if (result[i] == 'x') {
        int indexInTemp = tempWord.indexOf(currentWord[i]);
        if (indexInTemp != -1) {
          result = result.replaceRange(i, i + 1, 'n');
          tempWord[indexInTemp] = '*';
          neutralLetters += currentWord[i];
        } else {
          result = result.replaceRange(i, i + 1, 'f');
          if (!neutralLetters.contains(currentWord[i]) &&
              !trueLetters.contains(currentWord[i])) {
            wrongLetters += currentWord[i];
          }
        }
      }
    }

    backgrounds[gameIndex] = result;
  }

  void enter() {
    if (gameFinished || wordsEntered[gameIndex].length != wordLength) return;

    String enteredWord = wordsEntered[gameIndex].toLowerCase();
    String capitalizedWord =
        enteredWord[0].toUpperCase() + enteredWord.substring(1);

    if (wordList.contains(enteredWord) || wordList.contains(capitalizedWord)) {
      evaluateAndChangeBackgrounds();
      continueStatus = true;

      if (backgrounds[gameIndex] == 't' * wordLength) {
        gameFinished = true;
        gameResult = true;
      } else if (gameIndex == maxAttempts - 1) {
        gameFinished = true;
        gameResult = false;
      } else {
        gameIndex++;
      }
    } else {
      continueStatus = false;
    }
  }

  void restartGame() {
    initializeGame();
  }
}
