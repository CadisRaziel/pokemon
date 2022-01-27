import 'package:flutter/material.dart';
import 'package:pokedex2/common/models/pokemon.dart';
import 'package:pokedex2/features/pokedex/screens/details/details_arguments.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> list;

  //função para abrir a tela
  final Function(String, DetailsArguments) onItemTap;
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(list[index].name),
          onTap: () => onItemTap(
            '/ details',
            DetailsArguments(name: list[index].name),
          ),
        );
      },
    ));
  }
}
