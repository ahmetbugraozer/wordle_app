import 'package:flutter/material.dart';
import 'package:wordle_app/logic/functions.dart';
import 'package:wordle_app/ui/elements.dart';

class WordBox extends StatelessWidget {
  WordBox(
      {Key? key,
      required this.word,
      required this.boxIndex,
      required this.indicator,
      required this.gameIndex})
      : super(key: key);

  String word;
  List<String> indicator;
  int gameIndex;
  int boxIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            color: indicator[gameIndex].length >= boxIndex + 1
                ? (indicator[gameIndex][boxIndex] == "t"
                    ? (MyColors.lastResultTrueColor)
                    : (indicator[gameIndex][boxIndex] == "n"
                        ? MyColors.lastResultSemiTrueColor
                        : (indicator[gameIndex][boxIndex] == "f"
                            ? MyColors.firstNeutralColor
                            : MyColors.firstNeutralColor)))
                : MyColors.firstNeutralColor),
        child: Center(
            child: Text((word.length >= boxIndex + 1) ? word[boxIndex] : "",
                style: MyTextStyle.letterTextStyle)));
  }
}

class OperatorButton extends StatelessWidget {
  late String operator;
  OperatorButton({Key? key, required this.operator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        color: MyColors.firstNeutralColor,
        child: operator == "backspace"
            ? const Icon(Icons.backspace_outlined)
            : const Icon(Icons.turn_right));
  }
}

class LetterBox extends StatelessWidget {
  late String letter;
  LetterBox({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 30,
        color: MyColors.firstNeutralColor,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Center(child: Text(letter, style: MyTextStyle.letterTextStyle)));
  }
}
