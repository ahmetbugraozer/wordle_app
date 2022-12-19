// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wordle_app/ui/widgets.dart';

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
                      WordBox(word: word, boxIndex: 0),
                      WordBox(word: word, boxIndex: 1),
                      WordBox(word: word, boxIndex: 2),
                      WordBox(word: word, boxIndex: 3),
                      WordBox(word: word, boxIndex: 4),
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 1
                  ? [
                      WordBox(word: word, boxIndex: 0),
                      WordBox(word: word, boxIndex: 1),
                      WordBox(word: word, boxIndex: 2),
                      WordBox(word: word, boxIndex: 3),
                      WordBox(word: word, boxIndex: 4),
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 2
                  ? [
                      WordBox(word: word, boxIndex: 0),
                      WordBox(word: word, boxIndex: 1),
                      WordBox(word: word, boxIndex: 2),
                      WordBox(word: word, boxIndex: 3),
                      WordBox(word: word, boxIndex: 4),
                    ]
                  : [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameIndex >= 3
                  ? [
                      WordBox(word: word, boxIndex: 0),
                      WordBox(word: word, boxIndex: 1),
                      WordBox(word: word, boxIndex: 2),
                      WordBox(word: word, boxIndex: 3),
                      WordBox(word: word, boxIndex: 4),
                    ]
                  : [],
            ),
            SizedBox(height: 50)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 200,
                decoration: MyDecorations.keyBoardDecoration,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  addLetter("A");
                                },
                                child: LetterBox(letter: "A")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("B");
                                },
                                child: LetterBox(letter: "B")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("C");
                                },
                                child: LetterBox(letter: "C")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("D");
                                },
                                child: LetterBox(letter: "D")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("E");
                                },
                                child: LetterBox(letter: "E")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("F");
                                },
                                child: LetterBox(letter: "F")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("G");
                                },
                                child: LetterBox(letter: "G")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("H");
                                },
                                child: LetterBox(letter: "H")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("I");
                                },
                                child: LetterBox(letter: "I")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("J");
                                },
                                child: LetterBox(letter: "J")),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  addLetter("K");
                                },
                                child: LetterBox(letter: "K")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("L");
                                },
                                child: LetterBox(letter: "L")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("M");
                                },
                                child: LetterBox(letter: "M")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("N");
                                },
                                child: LetterBox(letter: "N")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("O");
                                },
                                child: LetterBox(letter: "O")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("P");
                                },
                                child: LetterBox(letter: "P")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("R");
                                },
                                child: LetterBox(letter: "R")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("S");
                                },
                                child: LetterBox(letter: "S")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("T");
                                },
                                child: LetterBox(letter: "T")),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  deleteLetter();
                                },
                                child: OperatorButton(operator: "backspace")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("U");
                                },
                                child: LetterBox(letter: "U")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("W");
                                },
                                child: LetterBox(letter: "W")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("Q");
                                },
                                child: LetterBox(letter: "Q")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("V");
                                },
                                child: LetterBox(letter: "V")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("X");
                                },
                                child: LetterBox(letter: "X")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("Y");
                                },
                                child: LetterBox(letter: "Y")),
                            GestureDetector(
                                onTap: () {
                                  addLetter("Z");
                                },
                                child: LetterBox(letter: "Z")),
                            GestureDetector(
                                onTap: () {
                                  enter();
                                },
                                child: OperatorButton(operator: "enter"))
                          ])
                    ]))));
  }
}
