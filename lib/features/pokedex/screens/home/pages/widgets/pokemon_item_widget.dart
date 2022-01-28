import 'package:flutter/material.dart';
import 'package:pokedex2/common/models/pokemon.dart';
import 'package:pokedex2/features/pokedex/screens/details/details_arguments.dart';
import 'package:pokedex2/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final Function(String, DetailsArguments) onTap;
  const PokemonItemWidget(
      {Key? key, required this.pokemon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/ details', DetailsArguments(pokemon: pokemon)),
      child: Container(
        decoration: BoxDecoration(
            //Base color criado para colocar uma cor de fundo dependendo do tipo de pokemon
            color: pokemon.baseColor!.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    '# ${pokemon.num}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.type
                        .map((e) => TypeWidget(
                              name: e,
                            ))
                        .toList(),
                  ),

                  //Coloando Flexible na image ela se ajusta do tamanho que encaixa no container
                  Flexible(
                    child: Image.network(
                      pokemon.image,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
