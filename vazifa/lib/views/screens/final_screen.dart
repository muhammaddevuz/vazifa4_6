import 'package:dars_6/views/screens/main_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FinalScreen extends StatelessWidget {
  int correctAnsver;
  FinalScreen({super.key, required this.correctAnsver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Correct Ansver: $correctAnsver",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ));
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
