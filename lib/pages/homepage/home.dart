import 'package:flutter/material.dart';
import '../../ui/elements.dart';
import '../../ui/widgets.dart';

class WordleGameHomePage extends StatefulWidget {
  const WordleGameHomePage({super.key});

  @override
  State<WordleGameHomePage> createState() => _WordleGameHomePageState();
}

class _WordleGameHomePageState extends State<WordleGameHomePage> {
  List<String> selections = ["Four", "Five", "Six"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const ProjectTitle(), toolbarHeight: 80, elevation: 5),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 1, child: Center(child: MyTexts.selectionText)),
              Expanded(
                  flex: 15,
                  child: SizedBox(
                      child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 2.1,
                          controller: ScrollController(keepScrollOffset: false),
                          children: selections
                              .map((e) => GameSelectionButton(letterAmount: e))
                              .toList())))
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
