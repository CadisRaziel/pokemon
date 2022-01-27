import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex2/common/repositories/pokemon_repository.dart';
import 'package:pokedex2/features/pokedex/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Api Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: PokedexRoutes(
          repository: PokemonRepository(dio: Dio()),
        )
        // home: HomeContainer(
        //   repository: PokemonRepository(
        //     dio: Dio(),
        //   ),
        // ),
        );
  }
}
