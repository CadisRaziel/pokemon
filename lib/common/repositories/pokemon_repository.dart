import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex2/common/const/consts_api.dart';
import 'package:pokedex2/common/error/failure_api.dart';

import 'package:pokedex2/common/interface/pokemin_interface.dart';
import 'package:pokedex2/common/models/pokemon.dart';

//Primeiro eu crio a interface pra depois criar o repository

class PokemonRepository implements IPokemonRepository {
  //No repository eu implemento o dio
  final Dio dio;
  PokemonRepository({
    required this.dio,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      //aqui nos consumimos a api e salvamos ela na variavel response
      final response = await dio.get(ConstsApi.allPokemonsUrl);

      //como a url retorna um json precisamos converter ele (colocamos as map pois o json retorna uma lista [{}])
      final json = jsonDecode(response.data) as Map<String, dynamic>;

      //aqui nos guardamos a chave 'pokemon' que esta no json em uma lista
      final list = json['pokemon'] as List<dynamic>;

      //agora com a lista recebendo a chave pokemon podemos criar um map
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw FailureApi(message: 'Não foi possivel carregar os dados');
    }
  }
}
