import 'package:flutter/material.dart';
import 'package:wordle_app/utils/words/words_4.dart';
import 'package:wordle_app/utils/words/words_5.dart';
import 'package:wordle_app/utils/words/words_6.dart';
import '../ui/elements.dart';
import '../ui/widgets.dart';

class WordleGameHomePage extends StatefulWidget {
  const WordleGameHomePage({super.key});

  @override
  State<WordleGameHomePage> createState() => _WordleGameHomePageState();
}

class _WordleGameHomePageState extends State<WordleGameHomePage> {
  final Map<String, List<String>> wordLists = {
    "Four": fourLetterWords,
    "Five": fiveLetterWords,
    "Six": sixLetterWords,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ProjectTitle(),
        toolbarHeight: 80,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Center(child: MyTexts.selectionText),
          ),
          Expanded(
            flex: 25,
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 2,
              controller: ScrollController(keepScrollOffset: false),
              children: wordLists.keys.map((key) {
                return GameSelectionButton(
                  letterAmount: key,
                  wordList: wordLists[key]!,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColors.backgroundColor,
        child: Center(
          child: Text(
            "AXEON",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 5,
                ),
          ),
        ),
      ),
    );
  }
}
