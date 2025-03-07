import 'package:flutter/material.dart';
import '../ui/elements.dart';
import '../ui/widgets.dart';

// home_page.dart
class WordleGameHomePage extends StatefulWidget {
  const WordleGameHomePage({super.key});

  @override
  State<WordleGameHomePage> createState() => _WordleGameHomePageState();
}

class _WordleGameHomePageState extends State<WordleGameHomePage> {
  final List<String> selections = ["Four", "Five", "Six"];

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
              children: selections.map((key) {
                return GameSelectionButton(
                  letterAmount: key,
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
