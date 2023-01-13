import 'package:flutter/material.dart';
import '../../ui/widgets.dart';
import '../../utils/alphabet.dart';
import "functions_six_letter.dart";
import '../../ui/elements.dart';

class SixLetterPage extends StatefulWidget {
  const SixLetterPage({super.key});

  @override
  State<SixLetterPage> createState() => _SixLetterPageState();
}

class _SixLetterPageState extends SixLetterLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Center(child: MyTexts.titleText),
            elevation: 5,
            actions: [
              IconButton(
                  onPressed: () {
                    restartGame();
                  },
                  icon: const Icon(Icons.restart_alt_outlined))
            ],
            toolbarHeight: 100),
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
                          gameIndex: 0),
                      WordBox(
                          word: wordsEntered[0],
                          boxIndex: 5,
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
                          gameIndex: 1),
                      WordBox(
                          word: wordsEntered[1],
                          boxIndex: 5,
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
                          gameIndex: 2),
                      WordBox(
                          word: wordsEntered[2],
                          boxIndex: 5,
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
                          gameIndex: 3),
                      WordBox(
                          word: wordsEntered[3],
                          boxIndex: 5,
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
                          gameIndex: 4),
                      WordBox(
                          word: wordsEntered[4],
                          boxIndex: 5,
                          indicator: backgrounds,
                          gameIndex: 4)
                    ]
                  : [])
        ]),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 230,
                decoration: MyDecorations.keyBoardDecoration,
                child: !gameFinished
                    ? Stack(children: [
                        GridView.count(
                            crossAxisCount: 7,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            padding: const EdgeInsets.all(5),
                            children: alphabet
                                .map((e) => !wrongLetters.contains(e)
                                    ? RawMaterialButton(
                                        onPressed: () {
                                          addLetter(e);
                                        },
                                        child:
                                            LetterBox(letter: e, isTrue: true))
                                    : LetterBox(letter: e, isTrue: false))
                                .toList()),
                        Positioned(
                            bottom: 10,
                            right: 65,
                            child: GestureDetector(
                                onTap: () {
                                  deleteLetter();
                                },
                                child: OperatorButton(operator: "backspace"))),
                        Positioned(
                            bottom: 10,
                            right: 10,
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
