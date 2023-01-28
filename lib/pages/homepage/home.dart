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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Divider(),
              Center(child: MyTexts.selectionText),
              const Divider(),
              GameSelectionButton(letterAmount: "Four"),
              GameSelectionButton(letterAmount: "Five"),
              GameSelectionButton(letterAmount: "Six")
            ]),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                color: MyColors.backgroundColor,
                height: 60,
                child: Center(
                    child: Text("AXEON",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 5))))));
  }
}
