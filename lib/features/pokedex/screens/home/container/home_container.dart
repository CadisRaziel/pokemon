import 'package:flutter/material.dart';
import 'package:pokedex2/common/error/failure_api.dart';
import 'package:pokedex2/common/interface/pokemin_interface.dart';
import 'package:pokedex2/common/models/pokemon.dart';
import 'package:pokedex2/features/pokedex/screens/details/details_arguments.dart';
import 'package:pokedex2/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex2/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex2/features/pokedex/screens/home/pages/home_page.dart';

//! Olha que interessante, o nosso HomeContainer sera instanciado no app_widget.dart na home
//! e nele que vai nosso FutureBuilder

class HomeContainer extends StatelessWidget {
  final IPokemonRepository repository;

  //função para abrir a tela
  final Function(String, DetailsArguments) onItemTap;
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      //*O 'future' vai buscar o metodo do 'repositories' (repare como eu instancio a interface IPokemonRepository e depois chamo ela aqui)
      //*O metodo getAllPokemons vai nos mostrar uma lista de pokemons
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        //se a tela estiver carregando 'waiting' ele vai retornar nossa tela de loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        //se carregeou usamos o 'done' e o 'hasData' para apresentar os dados
        else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data ?? [],
            onItemTap: onItemTap,
          );

          //se der erro usamos 'hasError' porém aqui o erro (repare que tratamos o erro com o FailueApi)
        } else if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as FailureApi).message!,
          );
        }

        //caso nao entrar em nenhuma das verificaçoes acima
        return const SizedBox.shrink();
      },
    );
  }
}
