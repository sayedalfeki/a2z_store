import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('A to Z store',style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
