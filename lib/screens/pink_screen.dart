import 'package:flutter/material.dart';

class PinkScreen extends StatelessWidget {
  const PinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text("Pink Screen"),
      ),
    );
  }
}
