import 'package:flutter/material.dart';
import '../ui/elements.dart';
import '../ui/widgets.dart';

class WordleGameHomePage extends StatefulWidget {
  const WordleGameHomePage({super.key});

  @override
  State<WordleGameHomePage> createState() => _WordleGameHomePageState();
}

class _WordleGameHomePageState extends State<WordleGameHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: MyTexts.titleText),
            toolbarHeight: 100,
            elevation: 5),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(flex: 1, child: Center(child: MyTexts.selectionText)),
          const Spacer(flex: 1),
          GameSelectionButton(letterAmount: "Four"),
          GameSelectionButton(letterAmount: "Five"),
          GameSelectionButton(letterAmount: "Six"),
          const Spacer(flex: 2)
        ]));
  }
}
