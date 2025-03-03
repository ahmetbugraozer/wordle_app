import 'package:flutter/material.dart';
import 'package:wordle_app/pages/homepage/home.dart';
import 'package:wordle_app/ui/elements.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool projectOpacity = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WordleGameHomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Center(child: Image.asset("assets/icon.png")),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              color: MyColors.backgroundColor,
              height: 60,
              child: Center(
                  child: Text("AXEON",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 5))))),
    );
  }
}
