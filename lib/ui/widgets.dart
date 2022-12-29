import 'package:flutter/material.dart';
import 'package:wordle_app/gamepages/4/page_four_letter.dart';
import 'package:wordle_app/gamepages/6/page_six_letter.dart';

import 'package:wordle_app/ui/elements.dart';
import '../gamepages/5/page_five_letter.dart';

class GameSelectionButton extends StatelessWidget {
  GameSelectionButton({Key? key, required this.letterAmount}) : super(key: key);
  late String letterAmount;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 150,
        color: MyColors.firstNeutralColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            if (letterAmount == "Four") {
              return const FourLetterPage();
            } else if (letterAmount == "Five") {
              return const FiveLetterPage();
            } else {
              return const SixLetterPage();
            }
          }));
        },
        child: Text("$letterAmount Letters"));
  }
}

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
        decoration: wordBoxDecoration(),
        child: Center(
            child: Text((word.length >= boxIndex + 1) ? word[boxIndex] : "",
                style: MyTextStyle.letterTextStyle)));
  }

  BoxDecoration wordBoxDecoration() {
    return BoxDecoration(
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
            : MyColors.firstNeutralColor);
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
  late bool isTrue;
  LetterBox({Key? key, required this.letter, required this.isTrue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 30,
        color:
            isTrue ? MyColors.firstNeutralColor : MyColors.keyboardFalseColor,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(child: Text(letter, style: MyTextStyle.letterTextStyle)));
  }
}
