import 'package:flutter/material.dart';
import 'package:wordle_app/ui/widgets.dart';
import 'package:wordle_app/utils/alphabet.dart';
import '../../../ui/elements.dart';
import 'functions_five_letter.dart';

class FiveLetterPage extends StatefulWidget {
  const FiveLetterPage({super.key});

  @override
  State<FiveLetterPage> createState() => _FiveLetterPageState();
}

class _FiveLetterPageState extends FiveLetterLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ProjectTitle(),
            elevation: 5,
            actions: [
              IconButton(
                  onPressed: () {
                    restartGame();
                  },
                  icon: const Icon(Icons.restart_alt_outlined))
            ],
            toolbarHeight: 80),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              child: continueStatus
                  ? null
                  : Center(child: MyTexts.inappriopriateWord)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 0
                  ? [
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 0,
                          indicator: backgrounds,
                          gameIndex: 0),
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 1,
                          indicator: backgrounds,
                          gameIndex: 0),
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 2,
                          indicator: backgrounds,
                          gameIndex: 0),
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 3,
                          indicator: backgrounds,
                          gameIndex: 0),
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 4,
                          indicator: backgrounds,
                          gameIndex: 0)
                    ]
                  : []),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 1
                  ? [
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 0,
                          indicator: backgrounds,
                          gameIndex: 1),
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 1,
                          indicator: backgrounds,
                          gameIndex: 1),
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 2,
                          indicator: backgrounds,
                          gameIndex: 1),
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 3,
                          indicator: backgrounds,
                          gameIndex: 1),
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 4,
                          indicator: backgrounds,
                          gameIndex: 1)
                    ]
                  : []),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 2
                  ? [
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 0,
                          indicator: backgrounds,
                          gameIndex: 2),
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 1,
                          indicator: backgrounds,
                          gameIndex: 2),
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 2,
                          indicator: backgrounds,
                          gameIndex: 2),
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 3,
                          indicator: backgrounds,
                          gameIndex: 2),
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 4,
                          indicator: backgrounds,
                          gameIndex: 2)
                    ]
                  : []),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 3
                  ? [
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 0,
                          indicator: backgrounds,
                          gameIndex: 3),
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 1,
                          indicator: backgrounds,
                          gameIndex: 3),
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 2,
                          indicator: backgrounds,
                          gameIndex: 3),
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 3,
                          indicator: backgrounds,
                          gameIndex: 3),
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 4,
                          indicator: backgrounds,
                          gameIndex: 3)
                    ]
                  : []),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 4
                  ? [
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 0,
                          indicator: backgrounds,
                          gameIndex: 4),
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 1,
                          indicator: backgrounds,
                          gameIndex: 4),
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 2,
                          indicator: backgrounds,
                          gameIndex: 4),
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 3,
                          indicator: backgrounds,
                          gameIndex: 4),
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 4,
                          indicator: backgrounds,
                          gameIndex: 4)
                    ]
                  : [])
        ]),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 265,
                decoration: MyDecorations.keyBoardDecoration,
                child: !gameFinished
                    ? Stack(children: [
                        Container(
                            color: MyColors.backgroundColor,
                            height: 35,
                            child: Center(
                                child: Text(
                                    "attempts remaining: ${4 - gameIndex}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)))),
                        Positioned(
                            top: 38,
                            child: SizedBox(
                                height: 250,
                                width: 392,
                                child: GridView.count(
                                    crossAxisCount: 7,
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    children: alphabet
                                        .map((e) => RawMaterialButton(
                                            onPressed: () {
                                              addLetter(e);
                                            },
                                            child: !wrongLetters.contains(e)
                                                ? LetterBox(
                                                    letter: e, isTrue: true)
                                                : LetterBox(
                                                    letter: e, isTrue: false)))
                                        .toList()))),
                        Positioned(
                            bottom: 6,
                            right: 60,
                            child: GestureDetector(
                                onTap: () {
                                  deleteLetter();
                                },
                                child: OperatorButton(operator: "backspace"))),
                        Positioned(
                            bottom: 6,
                            right: 4,
                            child: GestureDetector(
                                onTap: () {
                                  enter();
                                },
                                child: OperatorButton(operator: "enter")))
                      ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            MyTexts.gameOverText,
                            gameResult
                                ? MyTexts.resultWinText
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        MyTexts.resultLoseText,
                                        Text("$actualWord.",
                                            style:
                                                MyTextStyle.resultWordTextStyle)
                                      ]),
                            MaterialButton(
                                color: MyColors.firstNeutralColor,
                                onPressed: () {
                                  restartGame();
                                },
                                child: MyTexts.restartText)
                          ]))));
  }
}
