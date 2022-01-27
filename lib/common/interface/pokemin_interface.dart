import 'package:pokedex2/common/models/pokemon.dart';

//Primeiro eu crio a interface pra depois criar o repository
abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}
