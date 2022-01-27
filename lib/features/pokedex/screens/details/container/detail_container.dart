import 'package:flutter/material.dart';
import 'package:pokedex2/common/error/failure_api.dart';
import 'package:pokedex2/common/interface/pokemin_interface.dart';
import 'package:pokedex2/common/models/pokemon.dart';
import 'package:pokedex2/common/widgets/po_error.dart';
import 'package:pokedex2/common/widgets/po_loading.dart';
import 'package:pokedex2/features/pokedex/screens/details/details_arguments.dart';
import 'package:pokedex2/features/pokedex/screens/details/pages/detail_page.dart';

class DetailContainer extends StatelessWidget {
  final IPokemonRepository repository;
  final DetailsArguments arguments;
  const DetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      //*O 'future' vai buscar o metodo do 'repositories' (repare como eu instancio a interface IPokemonRepository e depois chamo ela aqui)
      //*O metodo getAllPokemons vai nos mostrar uma lista de pokemons
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        //se a tela estiver carregando 'waiting' ele vai retornar nossa tela de loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          //podia ser o HomeLoading tambem
          return const PoLoading();
        }

        //se carregeou usamos o 'done' e o 'hasData' para apresentar os dados
        else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            name: arguments.name,
            list: snapshot.data!,
          );

          //se der erro usamos 'hasError' porém aqui o erro (repare que tratamos o erro com o FailueApi)
        } else if (snapshot.hasError) {
          //Poderia ser o homeError aqui tambem
          return PoError(
            error: (snapshot.error as FailureApi).message!,
          );
        }

        //caso nao entrar em nenhuma das verificaçoes acima
        return const SizedBox.shrink();
      },
    );
  }
}
