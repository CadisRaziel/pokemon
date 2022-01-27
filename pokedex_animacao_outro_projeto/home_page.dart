import 'package:flutter/material.dart';

import 'pokedex.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pokedex(
        child: Container(
          width: 150,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
