import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex2/core/app_widget.dart';

void main() async {
  runApp(const MyApp());

  //Esse código precisa necessariamente vir depois do 'runApp'
  //ele tira aquela status bar que mostra a hora, wifi etc..
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}
