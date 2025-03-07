import 'package:flutter/material.dart';
import 'package:wordle_app/pages/gamepages/wordle_page.dart';
import 'package:wordle_app/ui/elements.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(height: 90, width: 180, child: Images.projectIcon));
  }
}

class GameSelectionButton extends StatelessWidget {
  final String letterAmount;

  const GameSelectionButton({
    Key? key,
    required this.letterAmount,
  }) : super(key: key);

  int _getWordLength() {
    switch (letterAmount) {
      case "Four":
        return 4;
      case "Five":
        return 5;
      case "Six":
        return 6;
      default:
        return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Stack(
        children: [
          Image.asset("assets/$letterAmount.jpg"),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "$letterAmount Letters",
              style: MyTextStyle.titleTextStyle,
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WordlePage(
              wordLength: _getWordLength(),
            ),
          ),
        );
      },
    );
  }
}

class WordBox extends StatelessWidget {
  const WordBox(
      {Key? key,
      required this.word,
      required this.boxIndex,
      required this.indicator,
      required this.gameIndex})
      : super(key: key);

  final String word;
  final List<String> indicator;
  final int gameIndex;
  final int boxIndex;

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
          BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
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
  final String operator;
  const OperatorButton({Key? key, required this.operator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors.firstNeutralColor,
            boxShadow: const [BoxShadow(offset: Offset(0, 0), blurRadius: 1)]),
        child: operator == "backspace"
            ? const Icon(Icons.backspace_outlined)
            : const Icon(Icons.turn_right));
  }
}

class LetterBox extends StatelessWidget {
  final String letter;
  final bool isProcessed;
  final bool isTrue;
  final bool isNeutral;
  final bool isTransparent;
  const LetterBox(
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
                ? [const BoxShadow(offset: Offset(0, 0), blurRadius: 1)]
                : []),
        child: Center(child: Text(letter, style: MyTextStyle.letterTextStyle)));
  }
}
