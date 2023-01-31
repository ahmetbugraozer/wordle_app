import 'package:flutter/material.dart';
import '../../../ui/widgets.dart';
import '../../../utils/alphabet.dart';
import "functions_six_letter.dart";
import '../../../ui/elements.dart';

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
                height: 320,
                decoration: MyDecorations.keyBoardDecoration,
                child: !gameFinished
                    ? Column(children: [
                        Expanded(
                            flex: 10,
                            child: Container(
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
                                                fontWeight:
                                                    FontWeight.w500))))),
                        const Spacer(flex: 1),
                        Expanded(
                            flex: 80,
                            child: GridView.count(
                                crossAxisCount: 7,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                children: alphabet
                                    .map((e) => (e != " ")
                                        ? RawMaterialButton(
                                            onPressed: () {
                                              addLetter(e);
                                            },
                                            child: wrongLetters.contains(e)
                                                ? LetterBox(
                                                    letter: e,
                                                    isProcessed: true,
                                                  )
                                                : (neutralLetters.contains(e) &&
                                                        !trueLetters.contains(e)
                                                    ? LetterBox(
                                                        letter: e,
                                                        isProcessed: true,
                                                        isNeutral: true)
                                                    : ((trueLetters.contains(e))
                                                        ? LetterBox(
                                                            letter: e,
                                                            isProcessed: true,
                                                            isTrue: true)
                                                        : LetterBox(
                                                            letter: e))))
                                        : LetterBox(
                                            letter: " ",
                                            isTransparent: true,
                                          ))
                                    .toList())),
                        Expanded(
                            flex: 20,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            deleteLetter();
                                          },
                                          child: OperatorButton(
                                              operator: "backspace"))),
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            enter();
                                          },
                                          child: OperatorButton(
                                              operator: "enter")))
                                ])),
                        const Spacer(flex: 2)
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
