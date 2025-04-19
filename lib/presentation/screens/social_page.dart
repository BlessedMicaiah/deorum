import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social')),
      body: const Center(
        child: Text('Welcome to the Social Page!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
