import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Select Range",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          // TODO: Validate the form
          // TODO: Navigate to generate number page
        },
      ),
    );
  }
}
