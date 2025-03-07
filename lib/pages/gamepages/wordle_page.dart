import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle_app/utils/word_service.dart';
import 'package:wordle_app/utils/word_validator_service.dart';
import '../../ui/widgets.dart';
import '../../utils/alphabet.dart';
import "game_logic.dart";
import '../../ui/elements.dart';

// wordle_page.dart
class WordlePage extends StatefulWidget {
  final int wordLength;

  const WordlePage({
    super.key,
    required this.wordLength,
  });

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  late GameLogic gameLogic;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  Future<void> _initializeGame() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      // Sözlüğü yükle
      await WordValidatorService.initialize();

      // API'den kelime al
      final word = await WordService.fetchWords(widget.wordLength);

      if (mounted) {
        setState(() {
          gameLogic = GameLogic(
            wordLength: widget.wordLength,
            wordList: word,
          );
          gameLogic.initializeGame();
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Initialize Game Error: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load word. Please try again.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const ProjectTitle(),
          toolbarHeight: 80,
          actions: [
            IconButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await _initializeGame();
              },
              icon: const Icon(Icons.loop_outlined),
            )
          ],
        ),
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const ProjectTitle(),
          toolbarHeight: 80,
          actions: [
            IconButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await _initializeGame();
              },
              icon: const Icon(Icons.loop_outlined),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage,
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    errorMessage = '';
                  });
                  _initializeGame();
                },
                child: Text(
                  'Retry',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    // Normal oyun ekranı
    return Scaffold(
      appBar: AppBar(
        title: const ProjectTitle(),
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await _initializeGame();
            },
            icon: const Icon(Icons.loop_outlined),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: gameLogic.continueStatus
                ? null
                : Center(child: MyTexts.inappriopriateWord),
          ),
          ...List.generate(
            GameLogic.maxAttempts,
            (i) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: gameLogic.gameIndex >= i
                  ? List.generate(
                      widget.wordLength,
                      (j) => WordBox(
                        word: gameLogic.wordsEntered[i],
                        boxIndex: j,
                        indicator: gameLogic.backgrounds,
                        gameIndex: i,
                      ),
                    )
                  : [],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 335,
        decoration: MyDecorations.keyBoardDecoration,
        child:
            !gameLogic.gameFinished ? _buildKeyboard() : _buildGameOverScreen(),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            color: MyColors.backgroundColor,
            height: 35,
            child: Center(
              child: Text(
                "attempts remaining: ${4 - gameLogic.gameIndex}",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 80,
          child: GridView.count(
            crossAxisCount: 7,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            controller: ScrollController(keepScrollOffset: false),
            children: alphabet.map((e) {
              if (e == " ") {
                return const LetterBox(letter: " ", isTransparent: true);
              }
              return RawMaterialButton(
                onPressed: () {
                  setState(() {
                    gameLogic.addLetter(e);
                  });
                },
                child: _buildLetterBox(e),
              );
            }).toList(),
          ),
        ),
        Expanded(
          flex: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gameLogic.deleteLetter();
                    });
                  },
                  child: const OperatorButton(operator: "backspace"),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gameLogic.enter();
                    });
                  },
                  child: const OperatorButton(operator: "enter"),
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildLetterBox(String letter) {
    if (gameLogic.wrongLetters.contains(letter)) {
      return LetterBox(letter: letter, isProcessed: true);
    }
    if (gameLogic.neutralLetters.contains(letter) &&
        !gameLogic.trueLetters.contains(letter)) {
      return LetterBox(
        letter: letter,
        isProcessed: true,
        isNeutral: true,
      );
    }
    if (gameLogic.trueLetters.contains(letter)) {
      return LetterBox(
        letter: letter,
        isProcessed: true,
        isTrue: true,
      );
    }
    return LetterBox(letter: letter);
  }

  Widget _buildGameOverScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyTexts.gameOverText,
        gameLogic.gameResult
            ? MyTexts.resultWinText
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTexts.resultLoseText,
                  Text(
                    "${gameLogic.actualWord}.",
                    style: MyTextStyle.resultWordTextStyle,
                  ),
                ],
              ),
        MaterialButton(
          color: MyColors.firstNeutralColor,
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await _initializeGame();
          },
          child: MyTexts.restartText,
        ),
      ],
    );
  }
}
