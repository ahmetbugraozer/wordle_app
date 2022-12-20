// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wordle_app/ui/widgets.dart';
import 'package:wordle_app/utils/alphabet.dart';

import 'ui/elements.dart';
import 'logic/functions.dart';

class WordleHomePage extends StatefulWidget {
  const WordleHomePage({super.key});

  @override
  State<WordleHomePage> createState() => _WordleHomePageState();
}

class _WordleHomePageState extends GameLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Center(child: MyTexts.titleText), toolbarHeight: 100),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 0
                  ? [
                      WordBox(word: wordsEntered[0], boxIndex: 0),
                      WordBox(word: wordsEntered[0], boxIndex: 1),
                      WordBox(word: wordsEntered[0], boxIndex: 2),
                      WordBox(word: wordsEntered[0], boxIndex: 3),
                      WordBox(word: wordsEntered[0], boxIndex: 4)
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 1
                  ? [
                      WordBox(word: wordsEntered[1], boxIndex: 0),
                      WordBox(word: wordsEntered[1], boxIndex: 1),
                      WordBox(word: wordsEntered[1], boxIndex: 2),
                      WordBox(word: wordsEntered[1], boxIndex: 3),
                      WordBox(word: wordsEntered[1], boxIndex: 4)
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 2
                  ? [
                      WordBox(word: wordsEntered[2], boxIndex: 0),
                      WordBox(word: wordsEntered[2], boxIndex: 1),
                      WordBox(word: wordsEntered[2], boxIndex: 2),
                      WordBox(word: wordsEntered[2], boxIndex: 3),
                      WordBox(word: wordsEntered[2], boxIndex: 4)
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 3
                  ? [
                      WordBox(word: wordsEntered[3], boxIndex: 0),
                      WordBox(word: wordsEntered[3], boxIndex: 1),
                      WordBox(word: wordsEntered[3], boxIndex: 2),
                      WordBox(word: wordsEntered[3], boxIndex: 3),
                      WordBox(word: wordsEntered[3], boxIndex: 4)
                    ]
                  : [],
            ),
            SizedBox(height: 50)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 230,
                decoration: MyDecorations.keyBoardDecoration,
                child: Stack(
                  children: [
                    GridView.count(
                        crossAxisCount: 7,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        padding: const EdgeInsets.all(5),
                        children: alphabet
                            .map((e) => RawMaterialButton(
                                onPressed: () {
                                  addLetter(e);
                                },
                                child: LetterBox(letter: e)))
                            .toList()),
                    Positioned(
                      bottom: 10,
                      right: 65,
                      child: GestureDetector(
                          onTap: () {
                            deleteLetter();
                          },
                          child: OperatorButton(operator: "backspace")),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                          onTap: () {
                            enter();
                          },
                          child: OperatorButton(operator: "enter")),
                    )
                  ],
                ))));
  }
}
