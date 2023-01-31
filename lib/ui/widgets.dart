import 'package:flutter/material.dart';
import 'package:wordle_app/pages/gamepages/4/page_four_letter.dart';
import 'package:wordle_app/pages/gamepages/6/page_six_letter.dart';

import 'package:wordle_app/ui/elements.dart';
import '../pages/gamepages/5/page_five_letter.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(height: 90, width: 180, child: Images.projectIcon));
  }
}

class GameSelectionButton extends StatelessWidget {
  GameSelectionButton({Key? key, required this.letterAmount}) : super(key: key);
  late String letterAmount;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Stack(children: [
          Image.asset("assets/$letterAmount.jpg"),
          Positioned(
              bottom: 10,
              left: 10,
              child: Text("$letterAmount Letters",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 35,
                      color: Colors.white)))
        ]),
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
        });
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
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(1, 5), blurRadius: 10)
        ],
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
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
        decoration: BoxDecoration(
            color: MyColors.firstNeutralColor,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), blurRadius: 5)]),
        child: operator == "backspace"
            ? const Icon(Icons.backspace_outlined)
            : const Icon(Icons.turn_right));
  }
}

class LetterBox extends StatelessWidget {
  late String letter;
  late bool isProcessed;
  late bool isTrue;
  late bool isNeutral;
  late bool isTransparent;
  LetterBox(
      {Key? key,
      required this.letter,
      this.isProcessed = false,
      this.isTrue = false,
      this.isNeutral = false,
      this.isTransparent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: isTransparent
                ? Colors.transparent
                : (isProcessed
                    ? (isTrue
                        ? MyColors.lastResultTrueColor
                        : (isNeutral
                            ? MyColors.lastResultSemiTrueColor
                            : MyColors.keyboardFalseColor))
                    : MyColors.firstNeutralColor),
            boxShadow: !isTransparent
                ? [const BoxShadow(offset: Offset(0, 0), blurRadius: 5)]
                : []),
        child: Center(child: Text(letter, style: MyTextStyle.letterTextStyle)));
  }
}
