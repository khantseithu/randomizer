import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;
  const RandomizerPage({super.key, required this.min, required this.max});

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int _randomNumber = 0;

  void _randomNumberGenerator() {
    final random = Random();
    int randomValue = widget.min + random.nextInt(widget.max - widget.min + 1);

    setState(() {
      _randomNumber = randomValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Random Number"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Text(
        "Generated Random Number, $_randomNumber",
        style: const TextStyle(
          fontSize: 24,
        ),
      )),
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton(
          child: const Text("Generate"),
          onPressed: () => {
            _randomNumberGenerator()
          },
        ),
      ),
    );
  }
}
