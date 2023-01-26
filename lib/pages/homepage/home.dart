import 'package:flutter/material.dart';
import '../../ui/elements.dart';
import '../../ui/widgets.dart';

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
            title: const ProjectTitle(), toolbarHeight: 80, elevation: 5),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(flex: 10, child: Center(child: MyTexts.selectionText)),
          const Spacer(flex: 2),
          GameSelectionButton(letterAmount: "Four"),
          const Spacer(flex: 1),
          GameSelectionButton(letterAmount: "Five"),
          const Spacer(flex: 1),
          GameSelectionButton(letterAmount: "Six"),
          const Spacer(flex: 18)
        ]));
  }
}
